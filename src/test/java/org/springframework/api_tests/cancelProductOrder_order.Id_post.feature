# ********RoostGPT********

# Test generated by RoostGPT for test api-fulfilment using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /cancelProductOrder/{order.Id}_post for http method type POST 
# RoostTestHash=f9512deb98
# 
# 

# ********RoostGPT********
Feature: Cancel Product Order By Id

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def auth = { Authorization: '#(karate.properties['AUTH_TOKEN'])' }
    * configure headers = auth

  Scenario Outline: Verify cancellation of product order by Id
    Given path '/cancelProductOrder/', '<orderId>'
    And request """
      { 
        "order": { 
          "associatedDocument": "<associatedDocument>", 
          "customer": { 
            "subscriberId": "<subscriberId>" 
          } 
        } 
      }
    """
    When method post
    Then status <statusCode>
    And match response == { control: { type: '<responseType>', code: '<responseCode>', message: '<responseMessage>' } }

    Examples:
      | orderId          | associatedDocument | subscriberId | statusCode | responseType | responseCode | responseMessage                      |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        200 | 'S'          | '200'        | 'OK'                                 |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        400 | 'E'          | '400'        | 'Bad Request'                        |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        401 | 'E'          | '401'        | 'Unauthorized'                       |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        403 | 'E'          | '403'        | 'Forbidden - Scope Not Permitted'    |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        404 | 'E'          | '404'        | 'Not Found'                          |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        406 | 'E'          | '406'        | 'Not Acceptable'                     |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        423 | 'E'          | '423'        | 'Agendamento não pode ser alterado'  |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        429 | 'E'          | '429'        | 'Too Many Requests - Exceeded Quota' |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        500 | 'T'          | '500'        | 'Internal Server Error'              |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        503 | 'T'          | '503'        | 'Service Unavailable'                |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |        504 | 'T'          | '504'        | 'Gateway Timeout'                    |
