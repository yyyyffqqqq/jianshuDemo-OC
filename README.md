# jianshuDemo-OC
##仿写 iOS 版简书客户端，支持ios 8.0以上；

##1、最新版的Wordpress-ios-edit使用pod install安装依赖后，不能正常运行；所以不使用最新版本，下载的是支持ios 8.0的Wordpress-ios-edit
，并对源代码进行了部分修改，以便可进行个性化定制；
##2、使用cocoaPods做依赖管理，下载后需要进入项目目录执行pod安装依赖，注意：使用 pod install 或 pod update命令会同时更新Wordpress-ios-edit，会导致引用到Wordpress-ios-edit编辑文章内容相关的部分不能正常使用，程序运行会出错，应该使用pod update --no-repo-update 命令；
