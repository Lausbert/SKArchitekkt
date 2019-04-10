//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

struct MacOSProject: Ressource {

    static let jsonString: String = """
{
  "children" : [
    {
      "identifier" : "AppDelegate.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "isRoot" : false,
          "scope" : "import_decl",
          "tags" : [
            "Cocoa"
          ]
        },
        {
          "arcs" : [
            {
              "identifier" : "AppDelegate.Type",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "NSObject",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "NSApplicationDelegate",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "NSWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_named",
                      "tags" : [
                        "window"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_typed"
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "NSWindow.Type",
                          "isRoot" : false,
                          "scope" : "unknown"
                        },
                        {
                          "identifier" : "NSWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "declref_expr",
                      "tags" : [
                        "function_ref=unapplied",
                        "implicit"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "NSWindow.Type",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "type_expr",
                      "tags" : [
                        "<<NULL>>",
                        "implicit",
                        "typerepr="
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "dot_syntax_call_expr",
                  "tags" : [
                    "implicit",
                    "nothrow"
                  ]
                }
              ],
              "isRoot" : false,
              "scope" : "pattern_binding_decl"
            },
            {
              "arcs" : [
                {
                  "identifier" : "NSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.window.self:7D8A4A8F-5738-4A54-8C0F-540FD525C1CC",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "isRoot" : false,
                      "scope" : "parameter_list"
                    },
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "load_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "accessor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "get_for=window",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.window.self:827AEA69-B851-42C1-BCEA-1E0C916116BF",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.window.value",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "parameter_list"
                    },
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "member_ref_expr",
                              "tags" : [
                                "direct_to_storage",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "assign_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "accessor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "implicit",
                    "interface",
                    "set_for=window"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "AppDelegate.window.self:9C116D89-1D95-4ECB-8148-191A7CF37A35",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "isRoot" : false,
                      "scope" : "parameter_list"
                    },
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_impl",
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "inout_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "yield_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "accessor_decl",
                  "tags" : [
                    "_modify_for=window",
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "identifier" : "AppDelegate.window",
              "isRoot" : false,
              "scope" : "var_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "interface",
                "readImpl=stored",
                "readWriteImpl=stored",
                "writeImpl=stored"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "NSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "AppDelegate.self:C9D4DE2A-AA82-4E98-AFC5-072CBFAADB50",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "children" : [
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "member_ref_expr",
                              "tags" : [
                                "direct_to_storage",
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "load_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "return_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "isRoot" : false,
              "scope" : "accessor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "get_for=window",
                "implicit",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "NSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "AppDelegate.self:020F5D6C-0F56-4730-BA21-4E75D98A6C46",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "NSWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "identifier" : "AppDelegate.value",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "children" : [
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "member_ref_expr",
                          "tags" : [
                            "direct_to_storage",
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "declref_expr",
                          "tags" : [
                            "function_ref=unapplied",
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "assign_expr",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "isRoot" : false,
              "scope" : "accessor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface",
                "set_for=window"
              ]
            },
            {
              "children" : [
                {
                  "identifier" : "AppDelegate.self:C1B6D1BA-FDC2-4A84-9049-B1FF14017736",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "children" : [
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "member_ref_expr",
                              "tags" : [
                                "direct_to_impl",
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "inout_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "yield_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "isRoot" : false,
              "scope" : "accessor_decl",
              "tags" : [
                "_modify_for=window",
                "access=internal",
                "implicit",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "Notification",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "AppDelegate.applicationDidFinishLaunching(_:).self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "Notification",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "identifier" : "AppDelegate.applicationDidFinishLaunching(_:).aNotification",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt"
                }
              ],
              "identifier" : "AppDelegate.applicationDidFinishLaunching(_:)",
              "isRoot" : false,
              "scope" : "func_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "Notification",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "AppDelegate.applicationWillTerminate(_:).self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "Notification",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "identifier" : "AppDelegate.applicationWillTerminate(_:).aNotification",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt"
                }
              ],
              "identifier" : "AppDelegate.applicationWillTerminate(_:)",
              "isRoot" : false,
              "scope" : "func_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "AppDelegate.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "children" : [
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSObject",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSObject",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSObject",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "other_constructor_ref_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                },
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSObject",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "super_ref_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "dot_syntax_call_expr",
                              "tags" : [
                                "implicit",
                                "nothrow",
                                "super"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "tuple_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "call_expr",
                          "tags" : [
                            "arg_labels=",
                            "implicit",
                            "nothrow"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "rebind_self_in_constructor_expr",
                      "tags" : [
                        "implicit"
                      ]
                    },
                    {
                      "isRoot" : false,
                      "scope" : "return_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "AppDelegate.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "designated",
                "dynamic",
                "implicit",
                "interface"
              ]
            },
            {
              "children" : [
                {
                  "identifier" : "AppDelegate.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "AppDelegate.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "AppDelegate",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "@objc",
            "access=internal",
            "interface",
            "non-resilient"
          ]
        }
      ],
      "identifier" : "AppDelegateSourceFile",
      "isRoot" : false,
      "scope" : "source_file"
    },
    {
      "identifier" : "NSApplicationDelegate",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "NSObject",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "NSWindow",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "NSWindow.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Notification",
      "isRoot" : false,
      "scope" : "unknown"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""

}
