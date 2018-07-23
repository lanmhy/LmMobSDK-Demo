Pod::Spec.new do |s|

  s.name         = "LmMobSDK"                
  s.version      = "5.0.1"                        
  s.summary      = "蓝莓互娱 提供的iOS端的SDK."           
  s.description      = "帮助开发者在开发项目时可以通过有效的第三方来更好更快的完善自己的激励视频，实现游戏变现，增加开发者收益."                 
  s.homepage     = "http://www.lmjoy.cn/"  
  s.documentation_url = "https://github.com/lanmhy/LmMobSDK-integrated-document/blob/master/LmMobSDK-integrated-document/%E8%93%9D%E8%8E%93%E8%81%9A%E5%90%88SDK%E6%89%8B%E5%8A%A8%E9%9B%86%E6%88%90%E6%96%87%E6%A1%A3/5.0.0/v5.0%E8%93%9D%E8%8E%93%E8%81%9A%E5%90%88SDK%E9%9B%86%E6%88%90%E6%96%87%E6%A1%A3.pdf"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { "lanmhy" => "lmios@lmjoy.cn",
                         "yihai"  => "chenyihai.2008@163.com" }  

  s.ios.deployment_target = '8.0' 
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }

  s.vendored_frameworks = 'LmMobSDK/frameworks/AdColony.framework','LmMobSDK/frameworks/Centrixlink.framework','LmMobSDK/frameworks/Chartboost.framework','LmMobSDK/frameworks/MTGSDK.framework','LmMobSDK/frameworks/MTGSDKReward.framework','LmMobSDK/frameworks/UnityAds.framework'

  s.vendored_libraries = 'LmMobSDK/libLmMobSDK.a'
  
  s.frameworks = 'Accelerate', 'AdSupport','AudioToolbox','AVFoundation','CFNetwork','CoreGraphics','CoreLocation','CoreTelephony','CoreMedia','CoreMotion','EventKit','GLKit','iAd','ImageIO','MediaPlayer','MessageUI','MobileCoreServices','QuartzCore','Security','Social','StoreKit','SystemConfiguration','WatchConnectivity','JavaScriptCore'   
  s.weak_framework = 'WebKit', 'UIKit', 'Foundation'
  s.libraries = 'c++','sqlite3','xml2','z','resolv.9'

  s.source       = { :git => "https://github.com/lanmhy/LmMobSDK-iOS.git", :tag => s.version }  
  s.source_files  = "LmMobSDK", "LmMobSDK/**/*.{h,m}"

  s.resources = 'LmMobSDK/Assets/*.png','LmMobSDK/Assets/*.bundle'

  s.public_header_files = 'LmMobSDK/LmMobSDK.h'

  s.requires_arc = true
   
  s.subspec 'Vungle' do |vungle|

       vungle.dependency 'VungleSDK-iOS', '~> 6.2.0'   #这里是直接引用了VungleSDK的cocoapod

   end

  s.subspec 'Admob' do |admob|

       admob.dependency 'Google-Mobile-Ads-SDK', '~> 7.31.0'   #这里是直接引用了Admob 的cocoapod
       
   end

end
