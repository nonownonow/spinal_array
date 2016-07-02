require '../config'

describe 'functional_browser', ->
   it 'start',->
      browser.url('http://webdriver.io')
      title=browser.getTitle()
      title.should.be.eql "WebdriverIO - Selenium 2.0 javascript bindings for nodejs"