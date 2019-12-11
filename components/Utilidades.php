<?php
namespace app\components;

use Yii;
use yii\helpers\Html;

class Utilidades
{
    public static function minizarString($str, $longitud)
    {
        if (strlen($str) < $longitud) {
            return $str;
        } else {
            $tmp = str_split($str, $longitud);
            return $tmp[0] . "...";
        }

        return null;
    }
    public static function minizarCadena($str, $longitud)
    {
        if (strlen($str) < $longitud) {
            return $str;
        } else {

            $tmp = substr($str, 0, $longitud);
            return $tmp . "...";
        }

        return null;
    }

    public static function eliminarSignos($str)
    {
        return preg_replace('/\W+/', ' ', $str);
    }

    public static function findCodeVideo($link)
    {

        $ps1 = strpos($link, '=');
        $pret = str_split($link, $ps1 + 1);
        $rs = $pret[1];
        if (!is_bool(strpos($pret[1], '&'))) {
            $ps2 = strpos($pret[1], '&');
            $tmp = str_split($pret[1], $ps2);
            $rs = $tmp[0];
        }
        return '<iframe src="http://www.youtube.com/embed/' . $rs . '" frameborder="0" width="425" height="350"></iframe>';
    }
    public static function checkStatus($valor)
    {
        switch ($valor) {
            case 1:$color = "warning";
                break;
            case 2:$color = "success";
                break;
            case 3:$color = "danger";
                break;
            case 4:$color = "info";
                break;
        }
        return $color;
    }

    public static function incrementar($valor, $incremento)
    {
        $valorsiguiente = $valor + $incremento;
        return $valorsiguiente;
    }

    public static function encriptar($password, $llave)
    {
        $password = serialize($password);
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC), MCRYPT_DEV_URANDOM);
        $llave = pack('H*', $llave);

        $mac = hash_hmac('sha256', $password, substr(bin2hex($llave), -32));
        $passcrypt = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $llave, $password . $mac, MCRYPT_MODE_CBC, $iv);
        $codificada = base64_encode($passcrypt) . '|' . base64_encode($iv);
        return $codificada;
    }

    public static function desencriptar($cadena, $llave)
    {
        $cadena = explode('|', $cadena . '|');
        $decodificada = base64_decode($cadena[0]);
        $iv = base64_decode($cadena[1]);
        if (strlen($iv) !== mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC)) {
            return false;
        }
        $llave = pack('H*', $llave);
        $desencrypt = trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $llave, $decodificada, MCRYPT_MODE_CBC, $iv));
        $mac = substr($desencrypt, -64);
        $desencrypt = substr($desencrypt, 0, -64);
        $calcmac = hash_hmac('sha256', $desencrypt, substr(bin2hex($llave), -32));
        if ($calcmac !== $mac) {
            return false;
        }
        $desencrypt = unserialize($desencrypt);
        return $desencrypt;
    }

    public static function validarPassword($passwordEntrante, $passwordBD)
    {

        $passwordBD = Utilidades::desencriptar($passwordBD, Yii::$app->params['llaveHexadecimal']);

        if ($passwordEntrante == $passwordBD) {
            return true;
        } else {
            return false;
        }
    }

    public static function mEncriptar($password)
    {
        $llave = Yii::$app->params['llaveHexadecimal'];
        $password = serialize($password);
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC), MCRYPT_DEV_URANDOM);
        $llave = pack('H*', $llave);

        $mac = hash_hmac('sha256', $password, substr(bin2hex($llave), -32));
        $passcrypt = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $llave, $password . $mac, MCRYPT_MODE_CBC, $iv);
        $codificada = base64_encode($passcrypt) . '|' . base64_encode($iv);
        return $codificada;
    }

    public static function cadenaAleatoria($longitud)
    {
        // estamos utilizando sólo este caracteres / números en la generación de cadena
        $caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        $cadena = ''; // definir variable con valor vacío
        // generamos un entero aleatorio en primer lugar, a continuación, nos estamos carácter correspondiente ,
        // tiene que poner el carácter a la variable $ cadena. estamos repitiendo este ciclo hasta que se alcanza
        // la longitud dada
        for ($i = 0; $i < $longitud; $i++) {
            $cadena .= $caracteres[rand(0, strlen($caracteres) - 1)];
        }
        return $cadena; // devolver la cadena final
    }

    public static function obtenerContenido($tipo)
    {
        $ruta = Yii::getAlias('@webroot') . "/archivos/formato/";
        $img = '';
        if ($tipo == 1) {
            $ruta .= 'cabecera.txt';
        } else if ($tipo == 2) {
            $ruta .= 'pie_pagina.txt';
        }

        if (file_exists($ruta)) {
            $img = file($ruta)[0];
        }
        return $img;
    }

    public static function enviarCorreo($params)
    {
        $correo = Yii::$app->mailer->compose('correos/' . $params['plantilla'], [
            //'logo' => '/plantillas/itvh/logos/logoitvhpie.png',
            'usuario' => $params['dest'],
        ]);
        $correo->setFrom('paginaitvh@itvillahermosa.edu.mx'); //Correo de mesa de ayuda
        $correo->setTo($params['dest']);
        $correo->setSubject($params['asunto']);
        if ($correo->send()) {
            return true;
        } else {
            return false;
        }
    }

    public static function contarDias($ini, $fin)
    {
        $ini = new \DateTime($ini);
        $fin = new \DateTime($fin);
        $fin->modify('+1 day');
        $interval = $fin->diff($ini);
        // total de dias
        $dias = $interval->days;
        // crear un periodo iterateable de la fecha ( P1D equivale a 1 día)
        $periodo = new \DatePeriod($ini, new \DateInterval('P1D'), $fin);
        // almacenado como matriz, por lo que puede añadir más de una
        $vacaciones = [];
        foreach ($periodo as $dt) {
            $hoy = $dt->format('D');
            //
            if (in_array($dt->format('Y-m-d'), $vacaciones)) {
                $dias--;
            }
            // Restar si es sabado o domingo
            if ($hoy == 'Sat' || $hoy == 'Sun') {
                $dias--;
            }
        }
        return $dias;
    }

    public static function actualizarPP($id)
    {
        $hoy = date("Y-m-d");
        $sg = \app\models\Seguimiento::find()->where("fkUsuario = {$id} AND cerrado != 1")->one();
        if ($sg !== null) {
            $pr = \app\models\Periodo::findOne(['estatus' => 1]);
            $total = self::contarDias($pr->fechaInicio, $pr->fechaCierre);
            $sys = self::contarDias($hoy, $pr->fechaCierre);
            $real = $total - $sys;
            //$porcent = ($real / $total) * 100;
            $sg->porcentaje = $real;
            $sg->save(false);
        }
    }

    public static function calcularHoras($t1, $t2)
    {
        list($h1, $m1) = sscanf($t1, "%d:%d");
        list($h2, $m2) = sscanf($t2, "%d:%d");

        $hrs = ($h2 - $h1) + ($m2 - $m1) / 60;

        if ($hrs < 0) {
            $hrs = $hrs + 24;
        }

        return $hrs;
    }

    public static function validarHorario($tiempos)
    {
        if (count($tiempos) == 3) {
            list($t1, $t2, $tn) = $tiempos;
            $t1 = +str_replace(":", "", $t1);
            $t2 = +str_replace(":", "", $t2);
            $tn = +str_replace(":", "", $tn);
            if ($t2 > $t1) { //Salida mayor a entrada
                return $t1 <= $tn && $tn < $t2; //True = Entrada es menor/igual a hora actual Y si hora actual es menor a Salida
            } else {
                return !($t2 <= $tn && $tn < $t1);
            }
        } else {
            return false;
        }
    }

    public static function inicializarKCFinder($ruta)
    {
        $kcfOptions = array_merge(\iutbay\yii2kcfinder\KCFinder::$kcfDefaultOptions, [
            'uploadURL' => Yii::getAlias('@web') . "/$ruta",
            'uploadDir' => Yii::getAlias('@app') . "/web/$ruta",
            'access' => [
                'files' => [
                    'upload' => true,
                    'delete' => true,
                    'copy' => false,
                    'move' => false,
                    'rename' => true,
                ],
                'dirs' => [
                    'create' => false,
                    'delete' => false,
                    'rename' => false,
                ],
            ],
        ]);
        return $kcfOptions;
    }

    public static function contadorVisitas($curso)
    {
        #Crear una sesión si no existe
        if (!isset($_SESSION)) {
            session_start();
        }

        #Directorio del contador
        $nombreContador = Yii::getAlias('@webroot/counters/visitas_' . $curso . '.txt');

        #Compruebe si existe un archivo de texto. Si no crear uno e inicializarlo a cero visitas y cero descargas.
        if (!file_exists($nombreContador)) {
            $f = fopen($nombreContador, "w");
            fwrite($f, "0" . PHP_EOL . "0");
            fclose($f);
        }

        #Recuperando las lineas como un arreglo
        $lines = file($nombreContador);
        $dVisitas = (int) $lines[0];
        $dArchivos = $lines[1];

        #¿Se ha contado al visitante en esta sesión?
        #Si no es así, aumente el valor del contador en uno
        if (!isset($_SESSION['visitado' . $curso])) {
            $_SESSION['visitado' . $curso] = "true";
            $dVisitas++;
            file_put_contents($nombreContador, $dVisitas . PHP_EOL . $dArchivos);
        }

        return $dVisitas;
    }

    
    /**
     * Convert a PHP array to HTML table.
     *
     * Example:
     *
     * ~~~
     * $data = [
     *     ['id' => 1, 'name' => 'John', 'birthday' => '01-Jul-1976', 'commission'=>'4,500.50', 'active' => true],
     *     [2, 'Scott', '26-Feb-1980', '1,300.40', true],
     *     [3, 'Mary', '1990-02-10', null, false],
     *     [4, 'Lisa', '17-Dec-1982', '-900.34', true],
     * ];
     * echo Enum::array2table($data);
     * ~~~
     *
     * @param array $array the associative array to be converted
     * @param boolean $transpose whether to show keys as rows instead of columns. This parameter should be used only
     * for a single dimensional associative array. If used for a multidimensional array, the sub array will be imploded
     * as text.
     * @param boolean $recursive whether to recursively generate tables for multi-dimensional arrays
     * @param boolean $typeHint whether to show the data type as a hint
     * @param string $null the content to display for blank cells
     * @param array $tableOptions the HTML attributes for the table
     * @param array $keyOptions the HTML attributes for the array key
     * @param array $valueOptions the HTML attributes for the array value
     *
     * @return string|boolean
     */
    public static function array2table(
      $array,
      $transpose = false,
      $recursive = false,
      $typeHint = false,
      $tableOptions = ['class' => 'table table-bordered table-striped'],
      $keyOptions = [],
      $valueOptions = ['style' => 'cursor: default; border-bottom: 1px #aaa dashed;'],
      $null = '<span class="not-set">(not set)</span>'
  ) {
      // Sanity check
      if (empty($array) || !is_array($array)) {
          return false;
      }
      // Start the table
      $table = Html::beginTag('table', $tableOptions) . "\n";
      // The header
      $table .= "\t<tr>";
      if ($transpose) {
          foreach ($array as $key => $value) {
              if ($typeHint) {
                  $valueOptions['title'] = self::getType(strtoupper($value));
              }
              if (is_array($value)) {
                  $value = '<pre>' . print_r($value, true) . '</pre>';
              } else {
                  $value = Html::tag('span', $value, $valueOptions);
              }
              $table .= "\t\t<th>" . Html::tag('span', $key, $keyOptions) . "</th>" .
                  "<td>" . $value . "</td>\n\t</tr>\n";
          }
          $table .= "</table>";
          return $table;
      }
      if (!isset($array[0]) || !is_array($array[0])) {
          $array = [$array];
      }
      // Take the keys from the first row as the headings
      foreach (array_keys($array[0]) as $heading) {
          $table .= '<th>' . Html::tag('span', $heading, $keyOptions) . '</th>';
      }
      $table .= "</tr>\n";
      // The body
      foreach ($array as $row) {
          $table .= "\t<tr>";
          foreach ($row as $cell) {
              $table .= '<td>';
              // Cast objects
              if (is_object($cell)) {
                  $cell = (array) $cell;
              }
              if ($recursive === true && is_array($cell) && !empty($cell)) {
                  // Recursive mode
                  $table .= "\n" . static::array2table($cell, true, true) . "\n";
              } else {
                  if (!is_null($cell) && is_bool($cell)) {
                      $val = $cell ? 'true' : 'false';
                      $type = 'boolean';
                  } else {
                      $chk = (strlen($cell) > 0);
                      $type = $chk ? self::getType($cell) : 'NULL';
                      $val = $chk ? htmlspecialchars((string) $cell) : $null;
                  }
                  if ($typeHint) {
                      $valueOptions['title'] = $type;
                  }
                  $table .= Html::tag('span', $val, $valueOptions);
              }
              $table .= '</td>';
          }
          $table .= "</tr>\n";
      }
      $table .= '</table>';
      return $table;
  }

  public static function getType($var)
  {
      if (is_array($var)) {
          return 'array';
      } elseif (is_object($var)) {
          return 'object';
      } elseif (is_resource($var)) {
          return 'resource';
      } elseif (is_null($var)) {
          return 'NULL';
      } elseif (is_bool($var)) {
          return 'boolean';
      } elseif (is_float($var) || (is_numeric(str_replace(',', '', $var)) && strpos($var, '.') > 0 &&
              is_float((float)str_replace(',', '', $var)))
      ) {
          return 'float';
      } elseif (is_int($var) || (is_numeric($var) && is_int((int)$var))) {
          return 'integer';
      } elseif (is_scalar($var) && strtotime($var) !== false) {
          return 'datetime';
      } elseif (is_scalar($var)) {
          return 'string';
      }
      return 'unknown';
  }

    public static function getDescargas($curso)
    {
        #Directorio del contador
        $nombreContador = Yii::getAlias('@webroot/counters/visitas_' . $curso . '.txt');

        #Recuperando las lineas como un arreglo
        $lines = file($nombreContador);
        $dArchivos = $lines[1];

        return $dArchivos;
    }

    public static function increaseDescargas($curso)
    {
        #Directorio del contador
        $nombreContador = Yii::getAlias('@webroot/counters/visitas_' . $curso . '.txt');

        #Recuperando las lineas como un arreglo e incrementando las descargas
        $lines = file($nombreContador);
        $dVisitas = (int) $lines[0];
        $dArchivos = (int) $lines[1] + 1;

        #Guardando los datos
        file_put_contents($nombreContador, $dVisitas . PHP_EOL . $dArchivos);
    }

    public static function formatoFecha($f)
    {
        setlocale(LC_ALL, "es_ES.utf8", "es_ES", "esp");
        $diasemana = strftime("%A", strtotime($f));
        $diames = strftime("%e", strtotime($f));
        $mes = strftime("%B", strtotime($f));
        $anio = strftime("%Y", strtotime($f));
        return "{$diasemana} {$diames} de {$mes} de {$anio}";
    }

    public static function basico($numero)
    {
        $valor = array('uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho',
            'nueve', 'diez', 'once', 'doce', 'trece', 'catorce', 'quince', 'dieciseis', 'diecisiete', 'dieciocho', 'diecinueve', 'veinte', 'ventiuno', 'ventidos', 'ventitres', 'veinticuatro', 'veinticinco',
            'veintiséis', 'veintisiete', 'veintiocho', 'veintinueve');

        return $valor[$numero - 1];
    }

    public static function decenas($n)
    {
        $decenas = array(30 => 'treinta', 40 => 'cuarenta', 50 => 'cincuenta', 60 => 'sesenta',
            70 => 'setenta', 80 => 'ochenta', 90 => 'noventa');
        if ($n <= 29) {
            return Utilidades::basico($n);
        }

        $x = $n % 10;
        if ($x == 0) {
            return $decenas[$n];
        } else {
            return $decenas[$n - $x] . ' y ' . Utilidades::basico($x);
        }

    }

    public static function centenas($n)
    {
        $cientos = array(100 => 'cien', 200 => 'doscientos', 300 => 'trecientos',
            400 => 'cuatrocientos', 500 => 'quinientos', 600 => 'seiscientos',
            700 => 'setecientos', 800 => 'ochocientos', 900 => 'novecientos');
        if ($n >= 100) {
            if ($n % 100 == 0) {
                return $cientos[$n];
            } else {
                $u = (int) substr($n, 0, 1);
                $d = (int) substr($n, 1, 2);
                return (($u == 1) ? 'ciento' : $cientos[$u * 100]) . ' ' . Utilidades::decenas($d);
            }
        } else {
            return Utilidades::decenas($n);
        }

    }

    public static function miles($n)
    {
        if ($n > 999) {
            if ($n == 1000) {return 'mil';} else {
                $l = strlen($n);
                $c = (int) substr($n, 0, $l - 3);
                $x = (int) substr($n, -3);
                if ($c == 1) {$cadena = 'mil ' . Utilidades::centenas($x);} else if ($x != 0) {$cadena = Utilidades::centenas($c) . ' mil ' . Utilidades::centenas($x);} else {
                    $cadena = Utilidades::centenas($c) . ' mil';
                }

                return $cadena;
            }
        } else {
            return Utilidades::centenas($n);
        }

    }

    public static function millones($n)
    {
        if ($n == 1000000) {return 'un millón';} else {
            $l = strlen($n);
            $c = (int) substr($n, 0, $l - 6);
            $x = (int) substr($n, -6);
            if ($c == 1) {
                $cadena = ' millón ';
            } else {
                $cadena = ' millones ';
            }
            return Utilidades::miles($c) . $cadena . (($x > 0) ? Utilidades::miles($x) : '');
        }
    }

    public static function convertirEnteros($n)
    {
        switch (true) {
            case ($n >= 1 && $n <= 29): return Utilidades::basico($n);
                break;
            case ($n >= 30 && $n < 100): return Utilidades::decenas($n);
                break;
            case ($n >= 100 && $n < 1000): return Utilidades::centenas($n);
                break;
            case ($n >= 1000 && $n <= 999999): return Utilidades::miles($n);
                break;
            case ($n >= 1000000): return Utilidades::millones($n);
        }
    }

    public static function convertir($d)
    {
        $d = number_format($d, 2, '.', '');
        $arr = explode('.', $d);
        $text = Utilidades::convertirEnteros($arr[0]) . " pesos con " . $arr[1] . "/100 MXN";

        return mb_strtoupper($text);
    }

    public static function limpiarArreglos($arrays)
    {
        $return = array();
        foreach ($arrays as $array) {
            if (is_array($array)) {
                array_push($return, $array);
            }
        }
        return $return;
    }

    public static function transpose_array_json($base, $newValues)
    {
        #Se llama a todas las opciones de vehiculo y accesorios disponibles
        $base = array_fill_keys($base, 'off');

        #Se separa cada grupo de opciones
        $res = array_merge($base, array_intersect_key($newValues, $base));

        #Se convierten en json
        return json_encode($res);
    }
    public static function getDate($format)
    {
        // format 'Y-m-d :: H:i:s'
        $date = new \DateTime('NOW', new \DateTimeZone('America/Mexico_City'));
        return $date->format($format);
    }

    public static function getImage(string $location)
    {
        if (file_exists($location)) 
        {
            $path = file_get_contents($location);
        } 
        else 
        {
            $path = file_get_contents('img/blank.png');;
        }

        return $path;
    }
}