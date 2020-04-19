//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

struct IOSProject: Ressource {

    static let jsonString: String = """
{
  "arcs" : [

  ],
  "children" : [
    {
      "arcs" : [

      ],
      "children" : [
        {
          "arcs" : [

          ],
          "children" : [
            {
              "arcs" : [

              ],
              "children" : [

              ],
              "id" : "4E9357A0-56AB-4651-A70E-DC84E290F3C8",
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "428A86F9-C5C3-4F15-8167-8F7B1C08237B",
                      "name" : "ViewController.viewDidLoad().self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "55AA8E7D-F35C-429C-87A2-1798EF826EFC",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "44A856D9-91DC-4EFA-B6F6-7BACBFB0F185",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "5FA0B8EB-72C4-4CCF-B8F4-AE9179782C39",
                              "scope" : "super_ref_expr",
                              "tags" : [

                              ]
                            }
                          ],
                          "id" : "D3D630F9-97C0-4876-943B-2FC9B3B94BEC",
                          "scope" : "dot_syntax_call_expr",
                          "tags" : [
                            "nothrow",
                            "super"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "DA155EC2-CA88-46A8-8B48-1725D9CF81DE",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "15977D43-BC77-4F2B-9286-0177550055D0",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "A0B4746C-15A3-4598-A653-4FFD96FCD104",
                  "name" : "ViewController.viewDidLoad()",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "dynamic",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "33C583C2-976C-4299-9659-A4C1A454DC0D",
                      "name" : "ViewController.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "92306FD7-A450-47F1-ADC5-50CA862BBA58",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "325B701B-7C1D-418C-B77B-D77EFA44F53E",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "2DBD8352-33CF-482A-AFCE-590EB8E97CFE",
                  "name" : "ViewController.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "54539778-BB3A-44FF-8884-B41E789D2CAF",
                      "name" : "ViewController.init(nibName:bundle:).self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "DA445CC2-59CD-4D82-908A-942092499063",
                          "name" : "ViewController.init(nibName:bundle:).nibNameOrNil",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=nibName",
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "73D35AB2-CBE2-46A6-94D3-B82D633A2CB4",
                          "name" : "ViewController.init(nibName:bundle:).nibBundleOrNil",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=bundle",
                            "interface"
                          ]
                        }
                      ],
                      "id" : "0C17F67F-A310-45AA-B3DA-B0A1D8A409AA",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "2BE2282F-69CB-4388-A599-4D0FEC46DF66",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "16A1AEBD-2CD5-49EE-9C13-767921D622EB",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "32E39F8C-06D5-4662-BD66-436F1C057234",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "A0533912-F24A-4FA4-B7CD-B23FC341C74A",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "AD888654-BF5F-497C-B659-1C1A372FF639",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "728FF7C8-863C-4B8B-87AF-A91DF60334D2",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    ",bundle",
                                    "implicit",
                                    "names=nibName"
                                  ]
                                }
                              ],
                              "id" : "C0C8130A-B89A-49AA-88F3-B3ED459C5CA3",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=nibName:bundle:",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "CE9B27B1-EAD3-4E44-99EC-4B123EDCAB73",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "7A78ED6A-37D2-4859-B7A4-39D40ED4D37E",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "0B563EBB-A409-4AAD-8C42-5ECB5710113C",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "093BD7FD-CEA9-4072-AD81-2C76C8558253",
                  "name" : "ViewController.init(nibName:bundle:)",
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
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "7A971269-2EAE-4120-8DAB-220353D13FF5",
                      "name" : "ViewController.init(coder:).self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "3489050E-F2FA-4715-AEE7-74BE0A0F7003",
                          "name" : "ViewController.init(coder:).coder",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=coder",
                            "interface"
                          ]
                        }
                      ],
                      "id" : "56645BEF-A65D-408D-A47F-1D5BA416398A",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "C65FCB6F-4F5F-4737-A8BF-79695FF382FA",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "8B7C9435-2211-4DB8-950A-339933352123",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "11171A39-E47E-4016-8A00-49E2A8E236E7",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "AB4B2AA3-77A3-48A5-9764-E68A958F9150",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "33968B96-0711-4A8A-9735-58D1415D0240",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit",
                                    "names=coder"
                                  ]
                                }
                              ],
                              "id" : "9598175B-DEC0-49BC-9188-18DCCED57026",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=coder:",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "86042A91-4FB0-4167-8186-38D535E3B9DF",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "E3F89335-4B9F-41C3-B394-4DF50CCDC8A6",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "704AEFBC-0D84-4502-B46E-9BF87BE2802A",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "B4ECCDB7-4706-4142-AC7D-81D9A7DFEC75",
                  "name" : "ViewController.init(coder:)",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "designated",
                    "dynamic",
                    "failable=Optional",
                    "implicit",
                    "interface",
                    "required"
                  ]
                }
              ],
              "id" : "5B59FF6A-6BD1-406F-B607-6A764E7B6194",
              "name" : "ViewController",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "407F4081-3CC7-4C99-932B-5411E16DF3C5",
          "name" : "ViewControllerSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        },
        {
          "arcs" : [

          ],
          "children" : [
            {
              "arcs" : [

              ],
              "children" : [

              ],
              "id" : "6DE9402A-9EB6-4B58-9587-A0B5CD5290C2",
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "F1B03D5E-D13D-4155-B251-7A97B21BC9B4",
                          "scope" : "pattern_named",
                          "tags" : [
                            "window"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "B4C490B1-64FC-4B41-B10D-504DC8766D3F",
                                  "scope" : "component",
                                  "tags" : [
                                    "UIWindow",
                                    "bind=UIKit.(file).UIWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "id" : "3596D989-4055-4061-A480-1E340FC463B9",
                              "scope" : "type_ident",
                              "tags" : [

                              ]
                            }
                          ],
                          "id" : "42080095-440D-48C0-9918-4B1971FDED03",
                          "scope" : "type_optional",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "6CC4DF2F-4279-43E1-9DB1-6CF72A8759B9",
                      "scope" : "pattern_typed",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "CE34DA7E-5ADD-4784-B513-8B60585C4291",
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "id" : "EFA6190A-C99F-4295-9D29-4142D6C60C21",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "9E0EE205-7CE6-4740-A7B5-BF84495610E8",
                          "name" : "AppDelegate.window.self:89C8DEBC-EB28-4255-B061-5C85A60E0EFB",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "887BED8E-3FB8-4566-9DC4-FA3B71D900F7",
                          "scope" : "parameter_list",
                          "tags" : [

                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "1E3F0A5E-61D2-44D0-8F60-A2410676E232",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "3CECC710-DB4A-4424-B529-3A46FCAD39C3",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "3A6FEC8B-DAA4-4ABA-98A6-94CB25500F0E",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "2B0A6013-BECF-435D-916B-B193B6A0E8E7",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "E5876212-9D38-49BF-825B-3F2CC2C9F62F",
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

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "41042614-3D44-400F-9738-13C822F99B41",
                          "name" : "AppDelegate.window.self:69E09CBB-53F6-440A-926C-FE05F34A0884",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "8917446A-0838-4ABE-96FF-0C5F2D8C81C7",
                              "name" : "AppDelegate.window.value",
                              "scope" : "parameter",
                              "tags" : [
                                "interface"
                              ]
                            }
                          ],
                          "id" : "EF9D96D1-BFF9-44D2-8817-B2536B8171EC",
                          "scope" : "parameter_list",
                          "tags" : [

                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "AC6C752C-5B03-4C43-9DDD-074FAA110069",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "A49A1584-6299-4E22-9794-8F10B7DF1F02",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "71A7CAAF-FDA2-43B5-A8B8-5225ED7EC208",
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "58770415-F00E-43B2-9CC4-22D4FF380CEF",
                              "scope" : "assign_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "0DA3C161-8F45-4A2E-80E4-C76B8F849582",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "8387B5F2-4F7B-402C-A15D-22D38F4A8270",
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
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "5FFBF716-A5CC-4EEA-95AB-801CD08ED6B9",
                          "name" : "AppDelegate.window.self:A1CC2C6C-51A2-4817-BE9E-5FD1C7DBDAC4",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "2DB3DFFC-FCF8-494D-A356-A06243B60FF2",
                          "scope" : "parameter_list",
                          "tags" : [

                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "0916E3F9-DA30-456D-8C39-1A52BBFA4DA3",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "id" : "98C0D87F-7217-496A-AA6B-EE2D29C450CB",
                                      "scope" : "member_ref_expr",
                                      "tags" : [
                                        "direct_to_impl",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "6FF39868-2EF8-4A14-9AA4-B2970E393622",
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "AFC469AB-2DFF-438D-A451-10490D89E7CF",
                              "scope" : "yield_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "CF3A4ACF-3965-4CBB-A92F-66001C33C7B7",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "AE72C1AC-FE35-4773-941E-D697DB6B528A",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "_modify_for=window",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "398AFC33-8190-4DAA-99EA-55BFA2E1D991",
                  "name" : "AppDelegate.window",
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

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "969405C2-EB53-406F-BA81-775F6CF159DC",
                      "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "4C47D1A8-01BF-43BC-B672-F554B7C58BD5",
                          "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "104B5A2C-204A-44C3-B66C-3B1CBC0CA7E3",
                          "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).launchOptions",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "1302631D-E658-4228-B572-C68A5CFA14CB",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "0620D268-863A-4E9F-9264-667C13863A7B",
                              "scope" : "component",
                              "tags" : [
                                "Bool",
                                "bind=Swift.(file).Bool",
                                "id="
                              ]
                            }
                          ],
                          "id" : "EC89BE29-273E-4385-B049-09AD18E9C7E6",
                          "scope" : "type_ident",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "74EF7B08-8C3E-4150-A3C1-932B1A371628",
                      "scope" : "result",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "9974A3FF-DCA4-4339-80A0-6CC6ACEB39ED",
                              "scope" : "boolean_literal_expr",
                              "tags" : [
                                "initializer=**NULL**",
                                "value=true"
                              ]
                            }
                          ],
                          "id" : "D8C91255-5AD0-445C-92AA-6B000BCE2C18",
                          "scope" : "return_stmt",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "6593A849-2BB0-4CBE-B8B8-F6FC25013398",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "F51ED343-E6D1-40E4-B7FF-DC881B95A7E9",
                  "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "72D883D1-9645-4D10-8797-7D95B4A16D44",
                      "name" : "AppDelegate.applicationWillResignActive(_:).self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "5338F98F-452D-472C-AEFA-C06BC6C925C0",
                          "name" : "AppDelegate.applicationWillResignActive(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "3898E718-408F-4EAA-BAEA-9B2642E634C5",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "F6DEF8BC-A401-4DB9-8DED-686BC9807396",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "1B4CBE6D-DAE1-4BD1-8E33-61A47674754A",
                  "name" : "AppDelegate.applicationWillResignActive(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "96033A51-18FF-4131-AF18-D53550A59CD1",
                      "name" : "AppDelegate.applicationDidEnterBackground(_:).self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "18EB1D9F-3D79-462D-8698-1679EE7D00F4",
                          "name" : "AppDelegate.applicationDidEnterBackground(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "A6471A81-BCA1-4BD1-8DBE-DA200EC13009",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "4D5F7CAA-DDFA-450C-87F4-6E3CD6CD27EC",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "687AF5AA-E81A-4B4F-A63B-DD036AC7A0B4",
                  "name" : "AppDelegate.applicationDidEnterBackground(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "81E57628-26A5-4B28-91DE-A84376E2F458",
                      "name" : "AppDelegate.applicationWillEnterForeground(_:).self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "FCA861AC-697F-4614-A9DB-8081376E97BE",
                          "name" : "AppDelegate.applicationWillEnterForeground(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "FC16D8E7-6238-4FB7-AA14-D3BA936298C4",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "FD5E2706-0A70-4B12-B000-1E82AE9DABD1",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "6C353567-C5AE-4363-A910-4BA3820BC03D",
                  "name" : "AppDelegate.applicationWillEnterForeground(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "42E67074-A6BA-4F89-AEEE-B4BECED82A7B",
                      "name" : "AppDelegate.applicationDidBecomeActive(_:).self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "C160E176-B77C-4551-9E9F-B40547DB41E6",
                          "name" : "AppDelegate.applicationDidBecomeActive(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "51323B8A-D28E-44B7-ADFC-C111F988F888",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "384DEA08-70ED-4572-838E-25AEA3D7BAF6",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "DD7F9A21-3FBE-46E6-9D0B-D3C54B3C5132",
                  "name" : "AppDelegate.applicationDidBecomeActive(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "30BBBB2E-1641-40BA-9F96-E025A2163DD0",
                      "name" : "AppDelegate.applicationWillTerminate(_:).self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "49C937D6-8DA4-44B9-B7C1-9E18D04244DB",
                          "name" : "AppDelegate.applicationWillTerminate(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "D06CEBC2-C35F-43E9-87D6-9D2F57535695",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "D9C900F2-B65A-4689-97AA-BA0FDC714AD3",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "33E94C9E-D66D-4607-8C93-85F1A66839FF",
                  "name" : "AppDelegate.applicationWillTerminate(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "BA5F404A-5B8B-4F51-9777-95168AF60F18",
                      "name" : "AppDelegate.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "DC02E813-9F0E-422E-8F1E-4C3941944BCC",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "61E1303D-8DAF-49F1-B4AC-55C99ECB1486",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "B3B8395F-837E-4289-8AF7-1C11A28B263C",
                  "name" : "AppDelegate.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "5D9E21FF-01ED-4077-A059-C753A71DAA78",
                      "name" : "AppDelegate.init().self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "2B4620F9-372F-46B2-A141-59495FDBEE91",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "A4458196-947C-45A1-963F-3DA107CDA2C8",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "B1807144-4DE1-4511-AE32-73882EB5796F",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "39E64634-76E0-4411-9536-4FC0D250C253",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "6672C87E-7A5B-46BC-BD3F-C253AB5DEF15",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "10742690-8C9A-4E99-B8EA-9EDEB07C5FCE",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "20328B2C-50B2-4675-AB2B-F84F9B93951E",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "03C2EC2E-090A-49E4-87AC-B1254AEFE82A",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "003BDFD8-CEF8-41DF-BBC0-13F49A959DF8",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "45015E91-F8E6-47DF-9430-BA0001C6BB48",
                  "name" : "AppDelegate.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "designated",
                    "dynamic",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "00BA95A5-FF78-469C-8321-3F0BFCF508E8",
              "name" : "AppDelegate",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "8E70B249-CDFC-48F0-9E78-95925CFA1DB6",
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "id" : "BF602A41-826B-4837-9F02-76D7E0527728",
      "name" : "iOSSDK",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "id" : "1F9639E5-B8C2-485D-BCA0-4F6E0FB542BF",
  "scope" : "root",
  "tags" : [

  ]
}
"""

}
