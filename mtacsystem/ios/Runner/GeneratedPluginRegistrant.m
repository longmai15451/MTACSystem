//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<dialogflow_grpc/DialogflowGrpcPlugin.h>)
#import <dialogflow_grpc/DialogflowGrpcPlugin.h>
#else
@import dialogflow_grpc;
#endif

#if __has_include(<fluttertoast/FluttertoastPlugin.h>)
#import <fluttertoast/FluttertoastPlugin.h>
#else
@import fluttertoast;
#endif

#if __has_include(<sound_stream/SoundStreamPlugin.h>)
#import <sound_stream/SoundStreamPlugin.h>
#else
@import sound_stream;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [DialogflowGrpcPlugin registerWithRegistrar:[registry registrarForPlugin:@"DialogflowGrpcPlugin"]];
  [FluttertoastPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttertoastPlugin"]];
  [SoundStreamPlugin registerWithRegistrar:[registry registrarForPlugin:@"SoundStreamPlugin"]];
}

@end
