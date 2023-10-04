<?php

// require 'vendor/autoload.php'; // Load PHPMailer library
// require 'PHPMailer/src/PHPMailer.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require_once __DIR__ . '/phpmailer/src/Exception.php';
require_once __DIR__ . '/phpmailer/src/PHPMailer.php';
require_once __DIR__ . '/phpmailer/src/SMTP.php';

// Set the MySQL login credentials
$servername = "mysql.menrvasolutions.com";
$username = "se51";
$password = "Sakec@1234";
$database = "eppodb";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  echo "Connected successfully";

  function daysFromNow($dateTimeString) {
    $now = new DateTime();
    $dateTime = new DateTime($dateTimeString);
    $interval = $now->diff($dateTime);
    return $interval->days;
}

// Query the database for appointments and user emails
$query = "SELECT a.Id, a.userId, a.Date, u.Email, Notified FROM Appointments AS a INNER JOIN Users AS u ON a.userId = u.Id";
$results = mysqli_query($conn, $query);

// Loop through each row of the results
while ($row = mysqli_fetch_assoc($results)) {
  $appointment_id = $row["Id"];
  $user_id = $row["userId"];
  $date = $row["Date"];
  // $time = $row["time"];
  $email = $row["Email"];
  $notified = $row["Notified"];
  
  // Check if the appointment time is less than 12 hours from now
  $dateTimeString = $date;
  // $datetime = DateTime::createFromFormat('Y-m-d H:i:s', $dateTimeString);
  // $now = time();
  // $now = date("Y-m-d H:i:s");
  // $now = DateTime::createFromFormat('Y-m-d H:i:s', $now);
  // $diff_hours = ($datetime - $now) / (60 * 60);
  // $interval = $now->diff($datetime);
  // $diff_hours = $interval->h + ($interval->days * 24);
  // echo "\n",$datetime;
  // echo "\n",$now;
  // echo "\n",$diff_hours;
  // if ($diff_hours < 12) {
  echo daysFromNow($date);
  if (daysFromNow($date) <= 1) {
    if($notified=="0"){

    // Create a new PHPMailer instance
    // $mail = new PHPMailer\PHPMailer\PHPMailer();
    $mail = new PHPMailer(true);

    try {
      // Server settings
      // $mail->SMTPDebug = SMTP::DEBUG_SERVER; // for detailed debug output
      $mail->isSMTP();
      $mail->Host = 'smtp.gmail.com';
      $mail->SMTPAuth = true;
      $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
      $mail->Port = 587;
  
      $mail->Username = 'gamechanger00029@gmail.com'; // YOUR gmail email
      $mail->Password = 'jsluazevflownext'; // YOUR gmail password
  
      // Sender and recipient settings
      $mail->setFrom('gamechanger00029@gmail.com', 'EPPO');
      $mail->addAddress($email);
      $mail->addReplyTo('gamechanger00029@gmail.com', 'EPPO'); // to set the reply to
  
      // Setting the email content
      $mail->IsHTML(true);
      $mail->Subject = "Appointment Reminder";
      $mail->Body = "This is a reminder for your appointment on $date.";
      // $mail->AltBody = $_POST['name'] . $_POST['email'] . $_POST['message'];
  
      // $mail->send();
      echo "OK";
  } catch (Exception $e) {
      echo "Error in sending email. Mailer Error: {$mail->ErrorInfo}";
  }
    
    // Update the appointment table to mark the appointment as notified
    $query = "UPDATE Appointments SET Notified = 1 WHERE id = $appointment_id";
    mysqli_query($conn, $query);
  }
  else{
    echo "already reminded";
  }
}
}

// Close the database connection
mysqli_close($conn);

?>
