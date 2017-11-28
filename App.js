/**
 * Swift Native Module Example
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Button,
  DeviceEventEmitter
} from 'react-native';
import DemoManager from './src/modules/DemoManager'

export default class App extends Component {

  componentWillMount() {
    DeviceEventEmitter.addListener(DemoManager.COUNTDOWN_EVENT, e => console.log('COUNTDOWN: ', e.value))
  }

  state = {
    randomNumber: '?',
    randomNumberStatus: '',
    lastRandomNumber: ''
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Swift Bridge!
        </Text>
        <Text style={styles.instructions}>
          Click to generate a random number, and check the console to verify all events
        </Text>
        <Button
          title = 'Generate Random Number'
          onPress = {() => {this.run()}}
        />
        <View style={styles.containerResult}>
          <Text style={styles.result}>
            Random Number: {this.state.randomNumber}
          </Text>
          <Text style={styles.result}>
            Number Message: {this.state.randomNumberStatus}
          </Text>
          <Text style={styles.result}>
            Last Random Number: {this.state.lastRandomNumber}
          </Text>
        </View>
      </View>
    );
  }

  run() {
    this.log()
    this.randomNumber(100)
  }

  log() {
    DemoManager.log('Swift Rocks !!!', Date.now())
  }

  randomNumber(max) {
    DemoManager.random(100, (value) => {
      const number = value.number
      this.setState({ randomNumber: number })
      this.isEven(number)
      this.countdown(number)
      this.getLastRandomNumber()
    })
  }

  isEven(number) {
    DemoManager.isEven(number,
                       () => this.setState({ randomNumberStatus : 'the number is even' }),
                       () => this.setState({ randomNumberStatus : 'the number is odd' }))
  }

  countdown(number) {
    DemoManager.countdown(number)
  }

  async getLastRandomNumber() {
    let last = await DemoManager.getLastRandomNumber()
    this.setState({ lastRandomNumber: last })
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 20,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 20,
  },
  button: {
    margin: 25
  },
  containerResult: {
    width: 250,
    margin: 20
  },
  result: {
    textAlign: 'left',
    color: '#333333',
    marginBottom: 5,
  }
});
