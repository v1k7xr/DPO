<?php
$configFileNmae = "config.ini";
$xmlfilename = "cd_catalog.xml";


class DBSaver {
    private $connectionData;
    private $connection;

    public function __construct($fileName) {
        $this->connectionData = parse_ini_file($fileName, TRUE);
    }

    public function openConnection() {
        try {
            $this->connection = new PDO("pgsql:host={$this->connectionData['dbconnection']['dbhost']};
                                         dbname={$this->connectionData['dbconnection']['dbname']}",
                                         $this->connectionData['dbconnection']['dbusername'],
                                         $this->connectionData['dbconnection']['bduserpassword'], [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        } catch (PDOException $e) {
            $message = date("[Y-m-d H:i:s]") . $e->getMessage() . "\n";
            echo $message;
            die();
        }
    }

    public function saveData2DB($items) {

        $stmt = $this->connection->prepare('INSERT INTO cd (title, artist, country, company, price, year) VALUES ( :title , :artist, :country , :company , :price, :year )');

        foreach ($items->CD as $cd) {
            $stmt->bindValue(':title', $cd->TITLE, PDO::PARAM_STR);
            $stmt->bindValue(':artist', $cd->ARTIST, PDO::PARAM_STR);
            $stmt->bindValue(':country', $cd->COUNTRY, PDO::PARAM_STR);
            $stmt->bindValue(':company', $cd->COMPANY, PDO::PARAM_STR);
            $stmt->bindValue(':price', $cd->PRICE, PDO::PARAM_STR);
            $stmt->bindValue(':year', $cd->YEAR, PDO::PARAM_INT);
            $stmt->execute();
        }

    }

    public function closeConnection() {
        $this->connection = null;
    }
}


$xml = simplexml_load_file($xmlfilename);

if ($xml === false) {
    die("Cannot open file $xmlfilename");
}

$dbSaver = new DBSaver($configFileNmae);

$dbSaver->openConnection();

$dbSaver->saveData2DB($xml);

$dbSaver->closeConnection();