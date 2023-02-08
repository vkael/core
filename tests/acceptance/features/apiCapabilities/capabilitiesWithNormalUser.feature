@api @files_sharing-app-required
Feature: default capabilities for normal user

  Background:
    Given using OCS API version "1"
    And user "Alice" has been created with default attributes and without skeleton files

  # adjust this scenario after fixing tagged issues as its just created to show difference
  # in the response items in different environment (core & ocis-reva)
  @issue-ocis-reva-175 @issue-ocis-reva-176
  Scenario: getting default capabilities with normal user
    When user "Alice" retrieves the capabilities using the capabilities API
    Then the OCS status code should be "100"
    And the HTTP status code should be "200"
#    And the capabilities should contain
#      | capability    | path_to_element                           | value             |
#      | core          | pollinterval                              | 30000             |
#      | core          | webdav-root                               | remote.php/webdav |
#      | core          | status@@@edition                          | %edition%         |
#      | core          | status@@@productname                      | %productname%     |
#      | core          | status@@@version                          | %version%         |
#      | core          | status@@@versionstring                    | %versionstring%   |
#      | files_sharing | api_enabled                               | 1                 |
#      | files_sharing | default_permissions                       | 31                |
#      | files_sharing | search_min_length                         | 2                 |
#      | files_sharing | public@@@enabled                          | 1                 |
#      | files_sharing | public@@@multiple                         | 1                 |
#      | files_sharing | public@@@upload                           | 1                 |
#      | files_sharing | public@@@supports_upload_only             | 1                 |
#      | files_sharing | public@@@send_mail                        | EMPTY             |
#      | files_sharing | public@@@social_share                     | 1                 |
#      | files_sharing | public@@@enforced                         | EMPTY             |
#      | files_sharing | public@@@enforced_for@@@read_only         | EMPTY             |
#      | files_sharing | public@@@enforced_for@@@read_write        | EMPTY             |
#      | files_sharing | public@@@enforced_for@@@upload_only       | EMPTY             |
#      | files_sharing | public@@@enforced_for@@@read_write_delete | EMPTY             |
#      | files_sharing | public@@@expire_date@@@enabled            | EMPTY             |
#      | files_sharing | public@@@defaultPublicLinkShareName       | Public link       |
#      | files_sharing | resharing                                 | 1                 |
#      | files_sharing | federation@@@outgoing                     | 1                 |
#      | files_sharing | federation@@@incoming                     | 1                 |
#      | files_sharing | group_sharing                             | 1                 |
#      | files_sharing | share_with_group_members_only             | EMPTY             |
#      | files_sharing | share_with_membership_groups_only         | EMPTY             |
#      | files_sharing | auto_accept_share                         | 1                 |
#      | files_sharing | user_enumeration@@@enabled                | 1                 |
#      | files_sharing | user_enumeration@@@group_members_only     | EMPTY             |
#      | files_sharing | user@@@send_mail                          | EMPTY             |
#      | files         | bigfilechunking                           | 1                 |
#      | files         | privateLinks                              | 1                 |
#      | files         | privateLinksDetailsParam                  | 1                 |
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
