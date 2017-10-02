# remote-backup
A simple scipt for backing up and moving backups

# ssh user@host 'kommando' skickar ett kommando som körs som den användaren
# script $logname börjar spela in allt som printas i konsolen
# tar -zvfc skapar ett arkiv som heter $backupname med allt som står i $backup_files
# scp skickar $backupname till den host som står i $targethostname och till sökvägen efter :
# rm -f tar bort den skickade filen så den inte tar onödig plats
# exit avslutar inspelning av logfilen
# det som är efter || körs endast om det tidiare argumentet inom paranteserna misslyckas
# sendmail skickar ett mail om något går fel med en bifogad fil
