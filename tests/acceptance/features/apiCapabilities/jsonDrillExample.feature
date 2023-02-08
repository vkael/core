@api @files_sharing-app-required @issue-ocis-reva-41
Feature: capabilities

  Background:
    Given using OCS API version "1"

  @smokeTest
  Scenario: Check that the sharing API can be enabled
    Given parameter "shareapi_enabled" of app "core" has been set to "no"
    And the capabilities setting of "files_sharing" path "api_enabled" has been confirmed to be ""
    When the administrator sets parameter "shareapi_enabled" of app "core" to "yes"
    Then the capabilities setting of "files_sharing" path "api_enabled" should be "1"

  @smokeTest @skipOnOcis
  Scenario: getting default capabilities with admin user
    When the administrator retrieves the capabilities using the capabilities API
    Then the OCS status code should be "100"
    And the HTTP status code should be "200"
#    And the capabilities should contain
#      | capability    | path_to_element                       | value             |
#      | core          | pollinterval                          | 30000             |
#      | core          | webdav-root                           | remote.php/webdav |
#      | files_sharing | api_enabled                           | 1                 |
#      | files_sharing | can_share                             | 1                 |
#      | files_sharing | public@@@enabled                      | 1                 |
#      | files_sharing | public@@@multiple                     | 1                 |
#      | files_sharing | public@@@upload                       | EMPTY             |
#      | files_sharing | public@@@send_mail                    | EMPTY             |
#      | files_sharing | public@@@social_share                 | 1                 |
#      | files_sharing | resharing                             | 1                 |
#      | files_sharing | federation@@@outgoing                 | 1                 |
#      | files_sharing | federation@@@incoming                 | 1                 |
#      | files_sharing | group_sharing                         | 1                 |
#      | files_sharing | share_with_group_members_only         | EMPTY             |
#      | files_sharing | user_enumeration@@@enabled            | 1                 |
#      | files_sharing | user_enumeration@@@group_members_only | EMPTY             |
#      | files         | bigfilechunking                       | 1                 |
    And the JSON data of the response should match
      """
      {
        "type": "object",
        "required": [
          "capabilities"
        ],
        "properties": {
          "capabilities": {
            "type": "object",
            "required": [
              "core",
              "files",
              "files_sharing"
            ],
            "properties": {
              "core": {
                "type": "object",
                "required": [
                  "pollinterval",
                  "webdav-root",
                  "status"
                ],
                "properties": {
                  "pollinterval": {
                    "type": "integer",
                    "enum": [
                      30000
                    ]
                  },
                  "webdav-root": {
                    "type": "string",
                    "enum": [
                      "remote.php/webdav"
                    ]
                  },
                  "status": {
                    "type": "object",
                    "required": [
                      "version",
                      "versionstring",
                      "edition",
                      "productname"
                    ],
                    "properties": {
                      "version": {
                        "type": "string",
                        "enum": [
                          "%version%"
                        ]
                      },
                      "versionstring": {
                        "type": "string",
                        "enum": [
                          "%versionstring%"
                        ]
                      },
                      "edition": {
                        "type": "string",
                        "enum": [
                          "%edition%"
                        ]
                      },
                      "productname": {
                        "type": "string",
                        "enum": [
                          "%productname%"
                        ]
                      }
                    }
                  }
                }
              },
              "files": {
                "type": "object",
                "required": [
                  "bigfilechunking",
                  "privateLinks",
                  "privateLinksDetailsParam"
                ],
                "properties": {
                  "bigfilechunking": {
                    "type": "boolean",
                    "enum": [
                      true
                    ]
                  },
                  "privateLinks": {
                    "type": "boolean",
                    "enum": [
                      true
                    ]
                  },
                  "privateLinksDetailsParam": {
                    "type": "boolean",
                    "enum": [
                      true
                    ]
                  }
                }
              },
              "files_sharing": {
                "type": "object",
                "required": [
                  "api_enabled",
                  "default_permissions",
                  "search_min_length",
                  "public",
                  "resharing",
                  "federation",
                  "group_sharing",
                  "share_with_group_members_only",
                  "share_with_membership_groups_only",
                  "auto_accept_share",
                  "user_enumeration"
                ],
                "properties": {
                  "api_enabled": {
                    "type": "boolean",
                    "enum": [
                      true
                    ]
                  },
                  "default_permissions": {
                    "type": "integer",
                    "enum": [
                      31
                    ]
                  },
                  "search_min_length": {
                    "type": "integer",
                    "enum": [
                      2
                    ]
                  },
                  "public": {
                    "type": "object",
                    "required": [
                      "enabled",
                      "multiple",
                      "upload",
                      "supports_upload_only",
                      "send_mail",
                      "social_share",
                      "defaultPublicLinkShareName"
                    ],
                    "properties": {
                      "enabled": {
                        "type": "boolean",
                        "enum": [
                          true
                        ]
                      },
                      "multiple": {
                        "type": "boolean",
                        "enum": [
                          true
                        ]
                      },
                      "upload": {
                        "type": "boolean",
                        "enum": [
                          true
                        ]
                      },
                      "supports_upload_only": {
                        "type": "boolean",
                        "enum": [
                          true
                        ]
                      },
                      "send_mail": {
                        "type": "boolean",
                        "enum": [
                          false
                        ]
                      },
                      "social_share": {
                        "type": "boolean",
                        "enum": [
                          true
                        ]
                      },
                      "defaultPublicLinkShareName": {
                        "type": "string",
                        "enum": [
                          "Public link"
                        ]
                      }
                    }
                  },
                  "resharing": {
                    "type": "boolean",
                    "enum": [
                      true
                    ]
                  },
                  "federation": {
                    "type": "object",
                    "required": [
                      "outgoing",
                      "incoming"
                    ],
                    "properties": {
                      "outgoing": {
                        "type": "boolean",
                        "enum": [
                          true
                        ]
                      },
                      "incoming": {
                        "type": "boolean",
                        "enum": [
                          true
                        ]
                      }
                    }
                  },
                  "group_sharing": {
                    "type": "boolean",
                    "enum": [
                      true
                    ]
                  },
                  "share_with_group_members_only": {
                    "type": "boolean",
                    "enum": [
                      false
                    ]
                  },
                  "share_with_membership_groups_only": {
                    "type": "boolean",
                    "enum": [
                      false
                    ]
                  },
                  "auto_accept_share": {
                    "type": "boolean",
                    "enum": [
                      true
                    ]
                  },
                  "user_enumeration": {
                    "type": "object",
                    "required": [
                      "enabled",
                      "group_members_only"
                    ],
                    "properties": {
                      "enabled": {
                        "type": "boolean",
                        "enum": [
                          true
                        ]
                      },
                      "group_members_only": {
                        "type": "boolean",
                        "enum": [
                          false
                        ]
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      """

  @smokeTest @skipOnOcis
  Scenario: getting default capabilities with admin user with new values
    When the administrator retrieves the capabilities using the capabilities API
    Then the OCS status code should be "100"
    And the HTTP status code should be "200"
#    And the capabilities should contain
#      | capability    | path_to_element                                          | value             |
#      | files_sharing | user@@@expire_date@@@enabled                             | EMPTY             |
#      | files_sharing | group@@@expire_date@@@enabled                            | EMPTY             |
#      | files_sharing | providers_capabilities@@@ocinternal@@@user@@@element[0]  | shareExpiration   |
#      | files_sharing | providers_capabilities@@@ocinternal@@@group@@@element[0] | shareExpiration   |
#      | files_sharing | providers_capabilities@@@ocinternal@@@link@@@element[0]  | shareExpiration   |
#      | files_sharing | providers_capabilities@@@ocinternal@@@link@@@element[1]  | passwordProtected |
    And the JSON data of the response should match
      """
      {
        "type": "object",
        "required": [
          "capabilities"
        ],
        "properties": {
          "capabilities": {
            "type": "object",
            "required": [
              "core",
              "files",
              "files_sharing"
            ],
            "properties": {
              "files_sharing": {
                "type": "object",
                "required": [
                  "user",
                  "group",
                  "providers_capabilities"
                ],
                "properties": {
                  "user": {
                    "type": "object",
                    "required": [
                      "expire_date"
                    ],
                    "properties": {
                      "expire_date": {
                        "type": "object",
                        "required": [
                          "enabled"
                        ],
                        "properties": {
                          "enabled": {
                            "type": "boolean",
                            "enum": [
                              false
                            ]
                          }
                        }
                      }
                    }
                  },
                  "group": {
                    "type": "object",
                    "required": [
                      "expire_date"
                    ],
                    "properties": {
                      "expire_date": {
                        "type": "object",
                        "required": [
                          "enabled"
                        ],
                        "properties": {
                          "enabled": {
                            "type": "boolean",
                            "enum": [
                              false
                            ]
                          }
                        }
                      }
                    }
                  },
                  "providers_capabilities": {
                    "type": "object",
                    "required": [
                      "ocinternal"
                    ],
                    "properties": {
                      "ocinternal": {
                        "type": "object",
                        "required": [
                          "user",
                          "group",
                          "link"
                        ],
                        "properties": {
                          "user": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "enum": ["shareExpiration"]
                            }
                          },
                          "group": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "enum": ["shareExpiration"]
                            }
                          },
                          "link": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "enum": ["shareExpiration", "passwordProtected"]
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
     """