<?php
//session_start();
namespace app\web\ws;

class APICl {
	public function API($app, $user, $pass, $role){
		// Dirección del recurso
	   
		$url = "http://192.168.4.25/intertecws/server/index.php";
		
		// Lista de variables para enviar
		$cero  =md5($app);
		$uno   =$this->encrypt($user,"513w521yfp51301");
		$dos   =$this->encrypt($pass,"513w521yfp51303");
		$tres  =$this->encrypt($role,"513w521yfp51305");
		$cuatro=$this->encrypt($_SERVER['REMOTE_ADDR'],"513w521yfp51307");
		
		$data = array('cero' => $cero, 'uno' => $uno, 'dos' => $dos, 'tres' => $tres, 'cuatro' => $cuatro);
		$result="-123";
		if(!isset($_SESSION['INTENTOSWS'])){$_SESSION['INTENTOSWS']=0;}
				
		if($_SESSION['INTENTOSWS']<3) {
			$ch = curl_init();
			curl_setopt($ch,CURLOPT_URL, $url);
			curl_setopt($ch,CURLOPT_POST, true);
			curl_setopt($ch,CURLOPT_POSTFIELDS, $data);
			curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
			$result = curl_exec($ch);
			$result = $this->decrypt($result,"513w521yfp51309");
			if(!$result || $result=="" || $result=="NO" || $result=="-123" || $result=="-456" || $result=="-789") {
				$_SESSION['INTENTOSWS']++;
			}
		}
		return $result && $result!=='' && $result!=='-123' && $result!=='-456' && $result!=='-789';
	}
	
	function encrypt($decrypted, $contrasena='zs13yfpW53ncd', $adicional='!WkDUn*fAF3p34FhjBm%1-')
	{   $key            = hash('sha256', $contrasena);
		$iv             = substr(hash('sha256', $adicional), 0, 16);
		$encrypt_method = "AES-256-CBC";
		$encrypted      = openssl_encrypt($decrypted, $encrypt_method, $key, 0, $iv);
		$encrypted      = base64_encode($encrypted);
		return $encrypted;
	}
	
	function decrypt($encrypted, $contrasena='zs13yfpW53ncd', $adicional='!WkDUn*fAF3p34FhjBm%1-') 
	{   $key            = hash('sha256', $contrasena);
		$iv             = substr(hash('sha256', $adicional), 0, 16);
		$encrypt_method = "AES-256-CBC";
		$decrypted      = base64_decode($encrypted);
		$decrypted      = openssl_decrypt($decrypted, $encrypt_method, $key, 0, $iv);
		return $decrypted;
	}
}
?>
