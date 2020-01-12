Feature: Check current weather forecast based on latitude and longtitude and other optional parameters

  Background:
    * configure ssl = true

  Scenario Outline: Find weather data based on provided values - <description>
    * def query = {lat:'<lat>', lon:'<lon>', marine: '<marine>', units:'<units>', lang: '<lang>',key: '#(apiKey)'}
    Given url baseUrl
    And params query
    When method get
    Then match responseStatus == 200
    And match response == {count: 1, data: '#notnull'}

    Examples:
      | description                                       | lat       | lon          | marine | units | lang |
      | only lat & long is provided                       | 33.8688   | 151.2093     | null   | null  | null |
      | Negative lat & long provided(automatic round-off) | -.099     | -.2093       | null   | null  | null |
      | Optional marine param provided                    | 40.9006   | 174.8860     | t      |       |      |
      | Optional marine,units(M) param provided           | 855       | -123         | t      | M     |      |
      | Optional marine,units(s)                          | 988.09888 | 2334.55567   | t      | S     |      |
      | Optional units(I)                                 | 675.511   | 1234.55      |        | I     |      |
      | Optional marine,units(I), language                | -788.99   | -1122.444444 | t      | I     | ar   |
      | Optional units(M), language(de)                   | 100.11    | -0.899       |        | M     | de   |


  Scenario Outline: API should return 400/403 based on incorrect values - <description>

    * def query = {lat:'<lat>', lon:'<lon>', marine: '<marine>', units:'<units>', lang: '<lang>',key: '<apikey>'}
    Given url baseUrl
    And params query
    When method get
    Then match responseStatus == <status>

    Examples:
      | description                      | lat       | lon         | marine | units | lang | apikey    | status |
      | incorrect lat & long             | latitude  | longtitude  |        |       |      | #(apiKey) | 400    |
      | Lat not provided                 |           | 144.88888   |        |       |      | #(apiKey) | 400    |
      | long not provided                | 455       |             |        |       |      | #(apiKey) | 400    |
      | Incorrect marine value           | 122.899   | 123.555     | ys     |       |      | #(apiKey) | 400    |
      | Incorrect units value            | 55.66     | 99.00       |        | q     | test | #(apiKey) | 400    |
      | incorrect marine,units, language | 562.36969 | 789.3695    | test   | a     | oi   | #(apiKey) | 400    |
      | incorrect api key                | -788.99   | -1122.44444 |        |       |      | randomkey | 403    |