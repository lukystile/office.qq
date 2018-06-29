<?php

/* @var $this yii\web\View */

$this->title = 'DASHBOARD';
?>
<header class="header mobile-only tablet-only">
      <div class="mobile-only tablet-only mobile-menu-current-page"><span><?= $this->title; ?></span><i class="header-menu-icon"></i></div>
    </header>
    <div class="row expanded">
      <div class="column large-12 medium-12 small-12">
        <div class="client_notification">
          <button class="close_notification"></button>
          <div class="notification_body">
            <p>Dear John,<br>
              Welcome to Winning-Heart-Rate!</p>
            <p>WHR online coaching platform is tailor made to your lifestyle, body type and personal training goals. 
              It will help you to follow your training plans as well as track down the training data and progress over the time. 
              This platform will serve you as your personal performance diary and our online coaching services will 
              help you on your way to success.</p>
            <p>Change your eating habits, maximize your performance levels and enjoy the transformation process.<br>
              Good luck, be patient and never back down from a challenging work out!</p>
            <p>Your personal Winning Coach, <br>
              Mikus Tiss.</p>
          </div>
        </div>
        <!--/notification-->
        <div class="white-block">
          <h3 class="block-head">Next Workout</h3>
          <table class="table unstriped next-workout mobile-accordion">
            <thead>
              <tr>
                <th>DATE</th>
                <th>WORKOUT TYPE</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>07 Jan 2017</td>
                <td>
                  <span>Cardio</span>
                  <div class="float-right">
                    <button class="button secondary">Log Workout</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td>10 Jan 2017</td>
                <td>
                  <span>Cardio</span>
                  <div class="float-right">
                    <button class="button secondary">Log Workout</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td>12 Jan 2017</td>
                <td>
                  <span>Cardio</span>
                  <div class="float-right">
                    <button class="button secondary">Log Workout</button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <!---->
        <div class="white-block">
          <h3 class="block-head">
            Progress Gallery
            <div class="float-right">
              <form action="#" enctype="multipart/form-data" method="POST" id="gallery-photo">
                <button class="button secondary gallery_upload_btn mobile-hide">Upload New Photo</button>
                <input type="file" accept="image/*" class="input_file input_gallery_upload">
              </form>
            </div>
          </h3>
          <div class="block-body row">
            <div class="large-12 medium-12 small-12 column">
              <ul class="gallery">
                <li>
                  <a href="images/gallery/gallery_photo_1.jpg">
                    <img src="images/gallery/gallery_photo_1.jpg" alt="">
                    <p>17 MAR 2016</p>
                  </a>
                </li>
                <li>
                  <a href="images/gallery/gallery_photo_2.jpg">
                    <img src="images/gallery/gallery_photo_2.jpg" alt="">
                    <p>30 MAR 2017</p>
                  </a>
                </li>
                <li>
                  <a href="images/gallery/gallery_photo_1.jpg">
                    <img src="images/gallery/gallery_photo_1.jpg" alt="">
                    <p>30 MAR 2017</p>
                  </a>
                </li>
                <li>
                  <a href="images/gallery/gallery_photo_2.jpg">
                    <img src="images/gallery/gallery_photo_2.jpg" alt="">
                    <p>17 MAR 2016</p> 
                  </a>               
                </li>
                <li>
                  <a href="images/gallery/gallery_photo_1.jpg">
                    <img src="images/gallery/gallery_photo_1.jpg" alt="">
                    <p>30 MAR 2017</p>
                  </a>                
                </li>
                <li>
                  <a href="images/gallery/gallery_photo_2.jpg">
                    <img src="images/gallery/gallery_photo_2.jpg" alt="">
                    <p>30 MAR 2017</p>
                  </a>
                </li>
              </ul>
              <button class="button secondary gallery_upload_btn mobile-only">Upload New Photo</button>
              <div class="show_all_btn_container">
                <button class="button alert show_all_btn btn-large">View All</button>
              </div>
            </div>
          </div>
        </div>
        <!---->
        <div class="white-block tips">
          <div class="block-body row">
            <div class="column large-12 medium-12 small-12">
              <h4>Tip of the day</h4>
              <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's 
                standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a 
                type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining 
                essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum 
                passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                </p>
            </div>
          </div>
        </div>
        <!---->
      </div>
    </div>
