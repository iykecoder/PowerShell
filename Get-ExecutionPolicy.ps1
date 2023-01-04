Get-ExecutionPolicy -List

Set-ExecutionPolicy -Scope Process Undefined
# -SCOPE { MachinePolicy, UserPolicy, Process, CurrentUser, LocalMachine }