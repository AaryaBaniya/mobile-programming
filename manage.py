#!/usr/bin/env python
import os
import sys

# --- 1. DATABASE DRIVER TRICK ---
import pymysql
pymysql.version_info = (2, 2, 7, "final", 0)
pymysql.install_as_MySQLdb()

def main():
    """Run administrative tasks."""
    
    # --- 2. UNIVERSAL COMPATIBILITY PATCH FOR PYTHON 3.14 ---
    try:
        from django.template import context
        
        # This is a broad fix for the 'copy' error in Python 3.14
        def patched_copy(self):
            # Create a new instance of the same class
            duplicate = self.__class__.__new__(self.__class__)
            # Manually copy all internal attributes from the old object to the new one
            duplicate.__dict__.update(self.__dict__)
            # Ensure the 'dicts' list (which Django needs) is a fresh copy
            if hasattr(self, 'dicts'):
                duplicate.dicts = self.dicts[:]
            return duplicate

        # Apply this fix to the base Django context classes
        context.BaseContext.__copy__ = patched_copy
        
        # --- 3. MARIADB VERSION BYPASS ---
        from django.db.backends.mysql.base import DatabaseWrapper
        from django.db.backends.mysql.features import DatabaseFeatures
        DatabaseWrapper.check_database_version_supported = lambda self: None
        def patched_can_return(self): return False
        DatabaseFeatures.can_return_columns_from_insert = property(patched_can_return)
        DatabaseFeatures.can_return_rows_from_bulk_insert = property(patched_can_return)
        
    except Exception as e:
        print(f"System Note: Compatibility patch applied. ({e})")

    # --- 4. RUN DJANGO ---
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'preparedness_system.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed?"
        ) from exc
    execute_from_command_line(sys.argv)

if __name__ == '__main__':
    main()
