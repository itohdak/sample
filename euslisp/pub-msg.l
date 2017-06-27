#!/usr/bin/env roseus

(defun setup ()
  (ros::roseus "pub_msg")
  ;; (ros::roseus-add-msgs "jsk_rviz_plugins")
  (setq *topic* "marker_topic")
  (ros::advertise *topic* visualization_msgs::MarkerArray 5)
  )

(defun pub ()
  (ros::rate 1)
  (do-until-key
   (let ((msg-array (instance visualization_msgs::MarkerArray :init))
	 (header (instance std_msgs::header :init :stamp (ros::time-now) :frame_id "/odom"))
	 msgs)
     (push (object->marker-msg (make-cube 100 100 100)
			       header
			       :ns "hoge"
			       :color #f(1 0 0)
			       :lifetime 5)
	   msgs)
     (send msg-array :markers msgs)
     (print msg-array)
     (ros::publish *topic* msg-array)
     )
   (ros::spin-once)
   (ros::sleep)
   ))
