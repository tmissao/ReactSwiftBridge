# React Swift Bridge

This React Native Project examplify how to writes iOS native modules using Swift 3 language. Making use of the main features to communicate with React.js like: 

* Callbacks 
``` javascript
  randomNumber(max) {
    DemoManager.random(100, (value) => {
      const number = value.number
      this.setState({ randomNumber: number })
      this.isEven(number)
      this.countdown(number)
      this.getLastRandomNumber()
    })
  }
```

* Promises
```javascript
  async getLastRandomNumber() {
    let last = await DemoManager.getLastRandomNumber()
    this.setState({ lastRandomNumber: last })
  }
```

* Events
```javascript
  componentWillMount() {
    DeviceEventEmitter.addListener(DemoManager.COUNTDOWN_EVENT, e => console.log('COUNTDOWN: ', e.value))
  }
```

For further details please check the files below:

* [App.js](https://github.com/tmissao/ReactSwiftBridge/blob/master/App.js) - Usage of Native Module
* [DemoManager.js](https://github.com/tmissao/ReactSwiftBridge/blob/master/src/modules/DemoManager.js) - Parse Native Module to JS
* [DemoManager.swift](https://github.com/tmissao/ReactSwiftBridge/blob/master/ios/DemoManager.swift) - Swift Native Module Implementation
* [DemoManagerBridge.m](https://github.com/tmissao/ReactSwiftBridge/blob/master/ios/DemoManagerBridge.m) - Exposed Swift methods to Objective-C
* [SwiftBridge-Bridging-Header.h](https://github.com/tmissao/ReactSwiftBridge/blob/master/ios/SwiftBridge-Bridging-Header.h) - Exposed Objective-C methods to Swift
