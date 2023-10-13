<?php
// Get the 't' parameter from the query string
$t = isset($_GET['t']) ? $_GET['t'] : '';

if (!empty($t)) {
    // Create a timestamp with the current date and time
    $timestamp = date('Y-m-d H:i:s');
    
    // Create a string with the data to be appended
    $data = "Timestamp: $timestamp | t: $t\n";

    // Define the filename for the log file
    $filename = 'log.txt';

    // Append the data to the log file
    file_put_contents($filename, $data, FILE_APPEND);

    echo "Data t appended to $filename: $data";
} else {
    echo "No 't' parameter provided.";
}

// Get the 't' parameter from the query string
$h = isset($_GET['h']) ? $_GET['h'] : '';

if (!empty($h)) {
    // Create a timestamp with the current date and time
    $timestamp = date('Y-m-d H:i:s');
    
    // Create a string with the data to be appended
    $data = "Timestamp: $timestamp | h: $h\n";

    // Define the filename for the log file
    $filename = 'log.txt';

    // Append the data to the log file
    file_put_contents($filename, $data, FILE_APPEND);

    echo "Data h appended to $filename: $data";
} else {
    echo "No 'h' parameter provided.";
}

?>
