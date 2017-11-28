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


