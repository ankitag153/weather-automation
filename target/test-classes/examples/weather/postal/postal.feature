Feature: Check current weather forecast based on latitude and longtitude and other optional parameters

  Background:
    * configure ssl = true

  Scenario Outline: Find weather data based on provided values - <description>
    * def query = {postal_code:'<postal_code>', country:'<country>', marine: '<marine>', units:'<units>', lang: '<lang>',key: '#(apiKey)'}
    Given url baseUrl
    And params query
    When method get
    Then match responseStatus == 200
    And match response == {count: 1, data: '#notnull'}

    Examples:
      | description                             | postal_code | country | marine | units | lang  |
      | Both post code and country provided     | 2000        | AU      | null   | null  | null  |
      | All query params provided               | 8000        | CH      | t      | M     | de    |
      | Alphanumeric postcode                   | P5N 2J4     |         |        |       |       |
#      | Postcode containing letters & symbol    | AI-2640     |         |        |       |       |
      | Longest digit postcode                  | 15119-43943 |         |        |       |       |
      | Optional marine param provided          | 7600        |         | t      |       |       |
      | Optional marine,units(M) param provided | 60641       |         | t      | M     |       |
      | Optional marine,units(s)                | D02 A272    |         | t      | S     |       |
      | Optional units(I)                       | 110001      |         |        | I     |       |
      | Optional units(M), language(zh-tw)      | 989900      |         |        | M     | zh-tw |


  Scenario Outline: API should return 204/400/403 based on incorrect values - <description>
    * def query = {postal_code:'<postal_code>', country:'<country>', marine: '<marine>', units:'<units>', lang: '<lang>',key: '<apikey>'}
    Given url baseUrl
    And params query
    When method get
    Then match responseStatus == <status>

    Examples:
      | description                                    | postal_code | country | marine | units | lang | apikey    | status |
      | postal code  correct, but no content available | AI-2640     |         |        |       |      | #(apiKey) | 204    |
      | postal code not provided                       |             |         |        |       |      | #(apiKey) | 400    |
      | Incorrect country code                         | 989900      | JN      |        |       |      | #(apiKey) | 204    |
      | Incorrect marine value                         | 989900      |         | ys     |       |      | #(apiKey) | 400    |
      | Incorrect units value                          | 5577        |         |        | test  |      | #(apiKey) | 400    |
      | incorrect marine,units, language               | 44467       |         | oi     | test  | ws   | #(apiKey) | 400    |
      | incorrect api key                              | 56778       |         |        |       |      | randomkey | 403    |