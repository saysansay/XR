Imports System
Imports System.Text
Imports System.Security.Cryptography
Imports CodeShare.Cryptography
Public Class TugasKeamananInformasi
Public Shared Function Createsalt() As String
   Dim myuuid As Guid = Guid.NewGuid()
   Dim salt As String = myuuid.ToString()
   Return salt
End Function

Public Shared Function Hash512(password As String, salt As String) As String
    Dim convertedToBytes As Byte() = Encoding.UTF8.GetBytes(password & salt)
    Dim hashType As HashAlgorithm = New SHA512Managed()
    Dim hashBytes As Byte() = hashType.ComputeHash(convertedToBytes)
    Dim hashedResult As String = Convert.ToBase64String(hashBytes)
    Return hashedResult

End Function
Public Shared Function VerifyHash(hashpwd As String, salt As String ,sourcepass As String) As Boolean
    Dim convertedToBytes As Byte() = Encoding.UTF8.GetBytes(sourcepass & salt)
    Dim hashType As HashAlgorithm = New SHA512Managed()
    Dim hashBytes As Byte() = hashType.ComputeHash(convertedToBytes)
    Dim verifyResult As String = Convert.ToBase64String(hashBytes)
    Dim result As Boolean 
    if hashpwd = verifyResult Then
        result = True
    else
        result = False
    end If
    Return result
End Function
    Public Shared Sub Main()
        Dim parSalt As String  = Createsalt()
        Dim parHash As String  = Hash512("XRyes",parSalt)
        Dim parVerify As Boolean = VerifyHash(parHash,parSalt,"XRyes")
        System.Console.WriteLine("Password Encrypt = XRyes")
        System.Console.WriteLine("Salt = "+parSalt)
        System.Console.WriteLine("Hash = "+parHash)
        System.Console.WriteLine("Verify Hash XRyes Result "+parVerify.ToString())
        
    End Sub
End Class
