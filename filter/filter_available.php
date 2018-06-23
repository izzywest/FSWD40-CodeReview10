<?php
ob_start();
session_start();
require_once '../dbconnect.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
header("Location: index.php");
exit;
}
// select logged-in users detail
$res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

$sql = "SELECT * FROM media INNER JOIN author ON media.fk_authorId = author.authorId WHERE status='available' ";
$result = $conn->query($sql);
?>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome <?php echo $userRow['userName']; ?></title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous"></head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


<body style="padding-top: 10px;">
    <div class="container">

        <div class="alert alert-secondary" style="background-image: url('../img/book.jpg'); background-repeat: no-repeat; background-position: absolute; text-align: right;">
            <p class="h6"><span class="badge badge-light">Logged in as <b><i class="fas fa-user"></i> <?php echo $userRow['userName']; ?> </b></span></p> 	 	
            <a href="../logout.php?logout"><button type="button" class="btn btn-info">Sign out <span class="badge badge-light"><i class="fas fa-sign-out-alt"></i></span></button></a>
        </div>



<!-- Content after login here -->


<!-- Filter by .. -->
<div class="btn-group">
  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-bottom:15px">
  Filter
  </button>
  <div class="dropdown-menu">
  <a class="dropdown-item" href="../home.php"><h5>All media</h5></a>
    <a class="dropdown-item" href="filter_available.php">Available media</a>
    <a class="dropdown-item" href="filter_publisher.php">Show all publisher</a>
    <a class="dropdown-item" href="filter_sortMedAsc.php">Sort media title asc</a>
    <a class="dropdown-item" href="filter_sortMedDesc.php">Sort media title desc</a>
    <a class="dropdown-item" href="filter_genreAsc.php">Sort genre asc</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><h5>Select type:</h5></a>
    <a class="dropdown-item" href="filter_type_game.php">Game</a>
    <a class="dropdown-item" href="filter_type_music.php">Music</a>
    <a class="dropdown-item" href="filter_type_movie.php">Movie</a>
    <a class="dropdown-item" href="filter_type_book.php">Book</a>
  </div>
</div>





<!-- Show the results -->

        <?php
            while($row = $result->fetch_assoc()) {
                echo
                "<div class='card col' style='margin-bottom: 10px;'>" .
                " <b>Title:</b> " . $row["title"].
                " <b>Type:</b> " . $row["type"].
                " <img src='" . $row["img"] . "' style='width: 20%'".
                " <b>Description:</b> " . $row["description"].
                " <b>ISBN/ASIN:</b> " . $row["ISBN_ASIN"].
                " <b>Publication:</b> " . $row["publDate"].
                " <b>Status:</b> " . $row["status"].
                " <b>Author:</b> " . $row["firstName"] . " " . $row["lastName"].
                "</div>";
            }
            $conn->close();
        ?>

   
    </div>
</body>
</html>
<?php ob_end_flush(); ?>