import os

# Define the name of the script and the output executable
script_name = 'hedgehog_app.py'
output_exe = 'HedgehogConverter.exe'
icon_file = 'hedgehog.png'

# Create the PyInstaller command
pyinstaller_command = f'pyinstaller --onefile --icon={icon_file} --name={output_exe} {script_name}'

# Execute the command
os.system(pyinstaller_command)
