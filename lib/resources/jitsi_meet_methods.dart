import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:pixel/resources/auth_methods.dart';
import 'package:pixel/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods =AuthMethods();
  final FireStoreMethods _fireStoreMethods = FireStoreMethods();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
    }) async{
    try {
	  FeatureFlag featureFlag = FeatureFlag();
	  featureFlag.welcomePageEnabled = false;
	  featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p
	String name;
    if(username.isEmpty){
        name = _authMethods.user.displayName!;
    }
    else{
      name= username;
    }
    var options = JitsiMeetingOptions(
        room: roomName
    )
         // Required, spaces will be trimmed
      ..userDisplayName = name
      ..userEmail = _authMethods.user.email
      ..userAvatarURL = _authMethods.user.photoURL // or .png
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted;
        
      _fireStoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
    
  }
}

