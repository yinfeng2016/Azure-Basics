#go to Win 10 64 bit OS folder
cd C:\Program Files (x86)\Windows Kits\10\bin\x64

#generate a root cert
makecert -sky exchange -r -n "CN=ARMP2SRootCert" -pe -a sha1 -len 2048 -ss My "ARMP2SRootCert.cer"

#To obtain the public key
#As part of the VPN Gateway configuration for Point-to-Site connections, the public key for the root certificate is uploaded to Azure.
#To obtain a .cer file from the certificate, open certmgr.msc. Right-click the self-signed root certificate, click all tasks, and then click export. 
#This opens the Certificate Export Wizard.
#In the Wizard, click Next, select No, do not export the private key, and then click Next.
#On the Export File Format page, select Base-64 encoded X.509 (.CER). Then, click Next.
#On the File to Export, Browse to the location to which you want to export the certificate. For File name, name the certificate file. Then click Next.
#Click Finish to export the certificate.

# generate a client cert
makecert.exe -n "CN=ClientCertificateName" -pe -sky exchange -m 96 -ss My -in "ARMP2SRootCert" -is my -a sha1

#Part 2 - Export a client certificate
#To export a client certificate, open certmgr.msc. Right-click the client certificate that you want to export, click all tasks, and then click export. 
#This opens the Certificate Export Wizard.
#In the Wizard, click Next, then select Yes, export the private key, and then click Next.
#On the Export File Format page, you can leave the defaults selected. Then click Next.
#On the Security page, you must protect the private key. If you select to use a password, make sure to record or remember the password that you set for this certificate. 
#Then click Next.
#On the File to Export, Browse to the location to which you want to export the certificate. For File name, name the certificate file. Then click Next.
#Click Finish to export the certificate.