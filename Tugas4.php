<?php
function createSalt()
{
    $text = md5(uniqid(rand(), TRUE));
    return substr($text, 0, 16);
}
function createSHA256($password,$salt){
    return hash('sha256',$salt.$password);
}
function verifyHash($hash,$password,$salt)
{
  $verifyHash = createSHA256($password,$salt);

  if($hash==$verifyHash)
  {
      return "true";
  }else {
      return "false";
  }
}
$password ="UBL";
$salt=createSalt();
$hashPwd = createSHA256($password,$salt);
$verify = verifyHash($hashPwd,$password,$salt);
echo "Password :".$password;
echo "<br>";
echo "Salt : ".$salt;
echo "<br>";
echo "Hash : ".$hashPwd;
echo "<br>";
echo "Verify Text : UBL  ".$verify;
