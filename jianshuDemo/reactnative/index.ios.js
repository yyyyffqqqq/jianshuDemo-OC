'use strict';

//var React = require('react-native');

import React from 'react-native'

var {
    Image,
    ListView,
    StyleSheet,
    Text,
    View,
    NativeModules,
    TouchableOpacity,
    NativeAppEventEmitter
} = React;

var RNIOSAlert = NativeModules.RNIOSAlert;

//监听oc中定义好的事件
var subscription = null;
subscription = NativeAppEventEmitter.addListener('EventReminder',(reminder) => console.log(reminder.name));

//NativeModules.NativeCallReact.sendEvents();

//class SimpleApp extends React.Component {
//    constructor(props) {
//        super(props);
//    }
//    
//}

var SimpleApp = React.createClass({
    getInitialState: function() {
        var ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2});
        return {
            dataSource: ds.cloneWithRows(this._genRows({})),
        };
    },
    render: function() {
        return (
                <TouchableOpacity onPress={()=>RNIOSAlert.show('from react native ')}>
                <ListView dataSource={this.state.dataSource}
                renderRow={this._renderRow} />
                </TouchableOpacity>
        );
    },
    _renderRow: function(rowData: string, sectionID: number, rowID: number) {
       var imgSource = {
           uri: 'http://img.wdjimg.com/image/video/64d23dde9daac32367954b7c8a803da0_0_0.jpeg',
        };
        return (
          <View>
            <View style={styles.row}>
              <Image style={styles.thumb} source={imgSource} />
              <Text style={styles.text}>
                 {rowData}
              </Text>
            </View>
            <View style={styles.separator} />
          </View>  
          );  
   },
    _genRows: function(pressData: {[key: number]: boolean}): Array<string> {
      var dataBlob = [];
      for (var ii = 0; ii < 10; ii++) {  
          dataBlob.push('Row ' + ii);
      }  
      return dataBlob;  
    },
                                  
  componentWillUnmount:function(){
      console.log("goodbye cruel world!")
      subscription && subscription.remove();
  }
});
var styles = StyleSheet.create({
   row: {
       flexDirection: 'row',
       justifyContent: 'center',
       padding: 10,
       backgroundColor: '#F6F6F6',
   },
   separator: {
       height: 1,
       backgroundColor: '#CCCCCC',  
   },  
   thumb: {  
       width: 64,
       height: 64,  
   },  
   text: { 
       flex: 1,
   }
 });
React.AppRegistry.registerComponent('SimpleApp', function() { return SimpleApp });