# frozen_string_literal: true

#
# This file is a part of the Ingram Micro’s CloudBlue Connect Workato Extension.
#
# @copyright (c) 2021. Ingram Micro. All Rights Reserved.
#

{
  title: 'CloudBlue Connect',

  connection: {
    fields: [
      {
        name: 'api_token',
        label: 'API Token',
        hint: "You can find your API Token in <a href='https://portal.connect.cloudblue.com/integrations/tokens/' target='_blank'>Connect</a>",
        optional: false
      }
    ],

    authorization: {
      type: 'custom_auth',

      apply: lambda do |connection|
        headers("Authorization": connection['api_token'])
      end
    },

    base_uri: lambda do
      'https://api.connect.cloudblue.com'
    end
  },

  test: lambda do |_connection|
    get('/public/v1')
  end,

  object_definitions: {

    custom_json_parameters: {
      fields: lambda do |_connection, config_fields|
        input_name = 'json_params'
        hint = ''
        input_label = 'Parameters JSON'
        call('custom_json_input', _connection, config_fields, input_name, input_label, hint)
      end

    },

    requests_inputs: {
      fields: lambda do
                [
                  {
                    name: 'asset_type',
                    label: 'Asset type',
                    control_type: 'select',
                    pick_list: 'asset_type',
                    hint: 'Pick desired asset type for search.',
                    optional: false
                  },
                  {
                    name: 'limit',
                    label: 'Limit',
                    hint: 'Limit of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'offset',
                    label: 'Offset',
                    hint: 'Offset of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.account_id',
                    label: 'Asset Account_id',
                    hint: 'Asset Account_id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.connection.environment',
                    label: 'Asset Connection Environment',
                    hint: 'Asset Connection Environment of recurring asset.',
                    pick_list: 'tcr_environment',
                    control_type: 'multiselect',
                    delimiter: ',',
                    optional: true
                  },
                  {
                    name: 'asset.connection.hub.id',
                    label: 'Asset Connection Hub Id',
                    hint: 'Asset Connection Hub Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.connection.hub.name',
                    label: 'Asset Connection Hub Name',
                    hint: 'Asset Connection Hub Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.connection.id',
                    label: 'Asset Connection Id',
                    hint: 'Asset Connection Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.connection.provider.id',
                    label: 'Asset Connection Provider Id',
                    hint: 'Asset Connection Provider Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.connection.provider.name',
                    label: 'Asset Connection Provider Name',
                    hint: 'Asset Connection Provider Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.connection.type',
                    label: 'Asset Connection Type',
                    pick_list: 'tcr_environment',
                    control_type: 'multiselect',
                    delimiter: ',',
                    hint: 'Asset Connection Type of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.connection.vendor.id',
                    label: 'Asset Connection Vendor Id',
                    hint: 'Asset Connection Vendor Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.connection.vendor.name',
                    label: 'Asset Connection Vendor Name',
                    hint: 'Asset Connection Vendor Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.contract.id',
                    label: 'Asset Contract Id',
                    hint: 'Asset Contract Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.external.id',
                    label: 'Asset External Id',
                    hint: 'Asset External Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.external_id',
                    label: 'Asset External_id',
                    hint: 'Asset External_id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.external_uid',
                    label: 'Asset External_uid',
                    hint: 'Asset External_uid of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.id',
                    label: 'Asset Id',
                    hint: 'Asset Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.marketplace.id',
                    label: 'Asset Marketplace Id',
                    hint: 'Asset Marketplace Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.marketplace.name',
                    label: 'Asset Marketplace Name',
                    hint: 'Asset Marketplace Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.params.id',
                    label: 'Asset Params Id',
                    hint: 'Asset Params Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.params.value',
                    label: 'Asset Params Value',
                    hint: 'Asset Params Value of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.product.id',
                    label: 'Asset Product Id',
                    hint: 'Asset Product Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.product.name',
                    label: 'Asset Product Name',
                    hint: 'Asset Product Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset_status',
                    label: 'Asset Status',
                    hint: 'Asset Status of recurring asset.',
                    pick_list: 'asset_status',
                    control_type: 'multiselect',
                    delimiter: ',',
                    optional: true
                  },
                  {
                    name: 'asset.tier1_id',
                    label: 'Asset Tier1_id',
                    hint: 'Asset Tier1_id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.tier2_id',
                    label: 'Asset Tier2_id',
                    hint: 'Asset Tier2_id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.tiers.customer.id',
                    label: 'Asset Tiers Customer Id',
                    hint: 'Asset Tiers Customer Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.tiers.customer.name',
                    label: 'Asset Tiers Customer Name',
                    hint: 'Asset Tiers Customer Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.tiers.tier1.id',
                    label: 'Asset Tiers Tier1 Id',
                    hint: 'Asset Tiers Tier1 Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.tiers.tier2',
                    label: 'Asset Tiers Tier2',
                    hint: 'Asset Tiers Tier2 of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset.tiers.tier2.id',
                    label: 'Asset Tiers Tier2 Id',
                    hint: 'Asset Tiers Tier2 Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__connection__environment',
                    label: 'Asset Connection Environment',
                    hint: 'Asset Connection Environment of recurring asset.',
                    pick_list: 'tcr_environment',
                    control_type: 'multiselect',
                    delimiter: ',',
                    optional: true
                  },
                  {
                    name: 'asset__connection__hub__id',
                    label: 'Asset Connection Hub Id',
                    hint: 'Asset Connection Hub Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__connection__hub__name',
                    label: 'Asset Connection Hub Name',
                    hint: 'Asset Connection Hub Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__connection__provider__id',
                    label: 'Asset Connection Provider Id',
                    hint: 'Asset Connection Provider Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__connection__provider__name',
                    label: 'Asset Connection Provider Name',
                    hint: 'Asset Connection Provider Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__connection__type',
                    label: 'Asset Connection Type',
                    hint: 'Asset Connection Type of recurring asset.',
                    pick_list: 'connection_type',
                    control_type: 'multiselect',
                    delimiter: ',',
                    optional: true
                  },
                  {
                    name: 'asset__connection__vendor__id',
                    label: 'Asset Connection Vendor Id',
                    hint: 'Asset Connection Vendor Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__connection__vendor__name',
                    label: 'Asset Connection Vendor Name',
                    hint: 'Asset Connection Vendor Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__id',
                    label: 'Asset Id',
                    hint: 'Asset Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__product__id',
                    label: 'Asset Product Id',
                    hint: 'Asset Product Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__product__name',
                    label: 'Asset Product Name',
                    hint: 'Asset Product Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__tiers__customer__id',
                    label: 'Asset Tiers Customer Id',
                    hint: 'Asset Tiers Customer Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__tiers__tier1__id',
                    label: 'Asset Tiers Tier1 Id',
                    hint: 'Asset Tiers Tier1 Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset__tiers__tier2__id',
                    label: 'Asset Tiers Tier2 Id',
                    hint: 'Asset Tiers Tier2 Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'asset_id',
                    label: 'Asset Id',
                    hint: 'Asset Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'assignee',
                    label: 'Assignee',
                    hint: 'Assignee of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'assignee.email',
                    label: 'Assignee Email',
                    hint: 'Assignee Email of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'assignee__email',
                    label: 'Assignee Email',
                    hint: 'Assignee Email of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'contract.id',
                    label: 'Contract Id',
                    hint: 'Contract Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'contract__id',
                    label: 'Contract Id',
                    hint: 'Contract Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'contract__id__exact',
                    label: 'Contract Id Exact',
                    hint: 'Contract Id Exact of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'created',
                    label: 'Created Period From',
                    type: 'timestamp',
                    hint: 'Created Period From of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'created_period_to',
                    label: 'Created Period To',
                    type: 'timestamp',
                    hint: 'Created Period To of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'id',
                    label: 'Id',
                    hint: 'Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'marketplace.id',
                    label: 'Marketplace Id',
                    hint: 'Marketplace Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'marketplace.name',
                    label: 'Marketplace Name',
                    hint: 'Marketplace Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'marketplace__name',
                    label: 'Marketplace Name',
                    hint: 'Marketplace Name of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'product_id',
                    label: 'Product Id',
                    hint: 'Product Id of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'status',
                    label: 'Status',
                    pick_list: 'fr_status',
                    control_type: 'multiselect',
                    delimiter: ',',
                    hint: 'Status of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'type',
                    label: 'Type',
                    hint: 'Type of recurring asset.',
                    pick_list: 'type_of_an_asset',
                    control_type: 'multiselect',
                    delimiter: ',',
                    optional: true
                  },
                  {
                    name: 'updated_period_from',
                    label: 'Updated Period From',
                    type: 'timestamp',
                    hint: 'Updated Period From of recurring asset.',
                    optional: true
                  },
                  {
                    name: 'updated_period_to',
                    label: 'Updated Period To',
                    type: 'timestamp',
                    hint: 'Updated Period To of recurring asset.',
                    optional: true
                  }
                ]
              end
    },

    products_params_response: {
      fields: lambda do
        [
          {
            name: 'products_params_response',
            type: 'array',
            properties: [
              {
                name: 'id'
              }, {
                name: 'name'
              }, {
                name: 'title'
              }, {
                name: 'description'
              }, {
                name: 'type'
              }, {
                name: 'scope'
              }, {
                name: 'phase'
              }, {
                name: 'constraints',
                type: 'object',
                properties: [
                  {
                    name: 'required'
                  }, {
                    name: 'hidden'
                  }, {
                    name: 'unique'
                  }, {
                    name: 'reconciliation'
                  }
                ]
              }, {
                name: 'position'
              }, {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }
                    ]
                  }, {
                    name: 'updated',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      end
    },

    products_items_response: {
      fields: lambda do
        [
          {
            name: 'products_items_response',
            type: 'array',
            properties: [
              {
                name: 'id'
              }, {
                name: 'name'
              }, {
                name: 'status'
              }, {
                name: 'unit',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }, {
                    name: 'title'
                  }, {
                    name: 'unit'
                  }
                ]
              }, {
                name: 'mpn'
              }, {
                name: 'position'
              }, {
                name: 'type'
              }, {
                name: 'local_id'
              }, {
                name: 'display_name'
              }, {
                name: 'period'
              }, {
                name: 'precision'
              }, {
                name: 'commitment',
                type: 'object',
                properties: [
                  {
                    name: 'multiplier'
                  }, {
                    name: 'count'
                  }
                ]
              }, {
                name: 'dynamic'
              }, {
                name: 'ui',
                type: 'object',
                properties: [
                  {
                    name: 'visibility'
                  }
                ]
              }, {
                name: 'ui_visibility'
              }, {
                name: 'description'
              }, {
                name: 'depth'
              }, {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }
                    ]
                  }, {
                    name: 'updated',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      end
    },
    search_recurring_assets_response: {
      fields: lambda do
                [
                  {
                    name: 'id'
                  },
                  {
                    name: 'type'
                  },
                  {
                    name: 'note'
                  },
                  {
                    name: 'reason'
                  },
                  {
                    name: 'created'
                  },
                  {
                    name: 'updated'
                  },
                  {
                    name: 'effective_date'
                  },
                  {
                    name: 'answered'
                  },
                  {
                    name: 'assignee'
                  },
                  {
                    name: 'activation_key'
                  },
                  {
                    name: 'marketplace',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      },
                      {
                        name: 'name'
                      },
                      {
                        name: 'icon'
                      }
                    ]
                  },
                  {
                    name: 'status'
                  },
                  {
                    name: 'previous_approved_request',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }
                    ]
                  },
                  {
                    name: 'asset',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      },
                      {
                        name: 'status'
                      },
                      {
                        name: 'external_id'
                      },
                      {
                        name: 'external_uid'
                      },
                      {
                        name: 'product',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          },
                          {
                            name: 'icon'
                          },
                          {
                            name: 'name'
                          },
                          {
                            name: 'status'
                          }
                        ]
                      },
                      {
                        name: 'connection',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          },
                          {
                            name: 'provider',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              },
                              {
                                name: 'name'
                              }
                            ]
                          },
                          {
                            name: 'vendor',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              },
                              {
                                name: 'name'
                              }
                            ]
                          },
                          {
                            name: 'type'
                          },
                          {
                            name: 'hub',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              },
                              {
                                name: 'name'
                              }
                            ]
                          }
                        ]
                      },
                      {
                        name: 'events',
                        type: 'object',
                        properties: [
                          {
                            name: 'created',
                            type: 'object',
                            properties: [
                              {
                                name: 'at'
                              }
                            ]
                          },
                          {
                            name: 'updated',
                            type: 'object',
                            properties: [
                              {
                                name: 'at'
                              }
                            ]
                          }
                        ]
                      },
                      {
                        name: 'items',
                        type: 'array',
                        properties: [
                          {
                            name: 'id'
                          },
                          {
                            name: 'global_id'
                          },
                          {
                            name: 'mpn'
                          },
                          {
                            name: 'old_quantity'
                          },
                          {
                            name: 'quantity'
                          },
                          {
                            name: 'type'
                          },
                          {
                            name: 'display_name'
                          },
                          {
                            name: 'period'
                          },
                          {
                            name: 'item_type'
                          }
                        ]
                      },
                      {
                        name: 'params',
                        type: 'array',
                        properties: [
                          {
                            name: 'id'
                          },
                          {
                            name: 'name'
                          },
                          {
                            name: 'type'
                          },
                          {
                            name: 'description'
                          },
                          {
                            name: 'value'
                          },
                          {
                            name: 'value_error'
                          },
                          {
                            name: 'structured_value',
                            type: 'object',
                            properties: []
                          },
                          {
                            name: 'value_choices',
                            type: 'array'
                          },
                          {
                            name: 'title'
                          }
                        ]
                      },
                      {
                        name: 'tiers',
                        type: 'object',
                        properties: [
                          {
                            name: 'customer',
                            type: 'object',
                            properties: [
                              {
                                name: 'external_id'
                              },
                              {
                                name: 'external_uid'
                              },
                              {
                                name: 'name'
                              },
                              {
                                name: 'tax_id'
                              },
                              {
                                name: 'contact_info',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'address_line1'
                                  },
                                  {
                                    name: 'address_line2'
                                  },
                                  {
                                    name: 'city'
                                  },
                                  {
                                    name: 'state'
                                  },
                                  {
                                    name: 'postal_code'
                                  },
                                  {
                                    name: 'country'
                                  },
                                  {
                                    name: 'contact',
                                    type: 'object',
                                    properties: [
                                      {
                                        name: 'first_name'
                                      },
                                      {
                                        name: 'last_name'
                                      },
                                      {
                                        name: 'email'
                                      },
                                      {
                                        name: 'phone_number',
                                        type: 'object',
                                        properties: [
                                          {
                                            name: 'country_code'
                                          },
                                          {
                                            name: 'area_code'
                                          },
                                          {
                                            name: 'phone_number'
                                          },
                                          {
                                            name: 'extension'
                                          }
                                        ]
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          },
                          {
                            name: 'tier1',
                            type: 'object',
                            properties: [
                              {
                                name: 'external_id'
                              },
                              {
                                name: 'external_uid'
                              },
                              {
                                name: 'name'
                              },
                              {
                                name: 'tax_id'
                              },
                              {
                                name: 'contact_info',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'address_line1'
                                  },
                                  {
                                    name: 'address_line2'
                                  },
                                  {
                                    name: 'city'
                                  },
                                  {
                                    name: 'state'
                                  },
                                  {
                                    name: 'postal_code'
                                  },
                                  {
                                    name: 'country'
                                  },
                                  {
                                    name: 'contact',
                                    type: 'object',
                                    properties: [
                                      {
                                        name: 'first_name'
                                      },
                                      {
                                        name: 'last_name'
                                      },
                                      {
                                        name: 'email'
                                      },
                                      {
                                        name: 'phone_number',
                                        type: 'object',
                                        properties: [
                                          {
                                            name: 'country_code'
                                          },
                                          {
                                            name: 'area_code'
                                          },
                                          {
                                            name: 'phone_number'
                                          },
                                          {
                                            name: 'extension'
                                          }
                                        ]
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          },
                          {
                            name: 'tier2',
                            type: 'object',
                            properties: [
                              {
                                name: 'external_id'
                              },
                              {
                                name: 'external_uid'
                              },
                              {
                                name: 'name'
                              },
                              {
                                name: 'tax_id'
                              },
                              {
                                name: 'contact_info',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'address_line1'
                                  },
                                  {
                                    name: 'address_line2'
                                  },
                                  {
                                    name: 'city'
                                  },
                                  {
                                    name: 'state'
                                  },
                                  {
                                    name: 'postal_code'
                                  },
                                  {
                                    name: 'country'
                                  },
                                  {
                                    name: 'contact',
                                    type: 'object',
                                    properties: [
                                      {
                                        name: 'first_name'
                                      },
                                      {
                                        name: 'last_name'
                                      },
                                      {
                                        name: 'email'
                                      },
                                      {
                                        name: 'phone_number',
                                        type: 'object',
                                        properties: [
                                          {
                                            name: 'country_code'
                                          },
                                          {
                                            name: 'area_code'
                                          },
                                          {
                                            name: 'phone_number'
                                          },
                                          {
                                            name: 'extension'
                                          }
                                        ]
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      },
                      {
                        name: 'configuration',
                        type: 'object',
                        properties: [
                          {
                            name: 'params',
                            type: 'array',
                            properties: [
                              {
                                name: 'id'
                              },
                              {
                                name: 'title'
                              },
                              {
                                name: 'description'
                              },
                              {
                                name: 'value'
                              },
                              {
                                name: 'type'
                              },
                              {
                                name: 'scope'
                              },
                              {
                                name: 'phase'
                              },
                              {
                                name: 'contraints',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'required'
                                  },
                                  {
                                    name: 'hidden'
                                  },
                                  {
                                    name: 'unique'
                                  },
                                  {
                                    name: 'shared'
                                  }
                                ]
                              },
                              {
                                name: 'events',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'created',
                                    type: 'object',
                                    properties: [
                                      {
                                        name: 'at'
                                      },
                                      {
                                        name: 'by',
                                        type: 'object',
                                        properties: [
                                          {
                                            name: 'id'
                                          },
                                          {
                                            name: 'name'
                                          }
                                        ]
                                      }
                                    ]
                                  },
                                  {
                                    name: 'updated',
                                    type: 'object',
                                    properties: [
                                      {
                                        name: 'at'
                                      },
                                      {
                                        name: 'by',
                                        type: 'object',
                                        properties: [
                                          {
                                            name: 'id'
                                          },
                                          {
                                            name: 'name'
                                          }
                                        ]
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      },
                      {
                        name: 'marketplace',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          },
                          {
                            name: 'name'
                          },
                          {
                            name: 'icon'
                          }
                        ]
                      },
                      {
                        name: 'contract',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          },
                          {
                            name: 'name'
                          }
                        ]
                      }
                    ]
                  }
                ]
              end
    },

    br_response: {
      fields: lambda do
        [
          {
            name: 'id'
          }, {
            name: 'type'
          },
          {
            name: 'events',
            type: 'object',
            properties: [
              {
                name: 'created',
                type: 'object',
                properties: [
                  {
                    name: 'at'
                  }
                ]
              }, {
                name: 'updated',
                type: 'object',
                properties: [
                  {
                    name: 'at'
                  }
                ]
              }
            ]
          }, {
            name: 'asset',
            type: 'object',
            properties: [
              {
                name: 'id'
              }, {
                name: 'status'
              }, {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }
                    ]
                  }, {
                    name: 'updated',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }
                    ]
                  }
                ]
              }, {
                name: 'external_id'
              }, {
                name: 'external_uid'
              }, {
                name: 'product',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }, {
                    name: 'status'
                  }, {
                    name: 'icon'
                  }
                ]
              }, {
                name: 'connection',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'hub',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }
                    ]
                  }, {
                    name: 'provider',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }
                    ]
                  }, {
                    name: 'vendor',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }, {
                        name: 'icon'
                      }
                    ]
                  }, {
                    name: 'type'
                  }
                ]
              }, {
                name: 'params',
                type: 'array'
              }, {
                name: 'tiers',
                type: 'object',
                properties: [
                  {
                    name: 'customer',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'external_id'
                      }, {
                        name: 'external_uid'
                      }, {
                        name: 'name'
                      }, {
                        name: 'tax_id'
                      }, {
                        name: 'contact_info',
                        type: 'object',
                        properties: [
                          {
                            name: 'address_line1'
                          }, {
                            name: 'address_line2'
                          }, {
                            name: 'city'
                          }, {
                            name: 'state'
                          }, {
                            name: 'postal_code'
                          }, {
                            name: 'country'
                          }, {
                            name: 'contact',
                            type: 'object',
                            properties: [
                              {
                                name: 'first_name'
                              }, {
                                name: 'last_name'
                              }, {
                                name: 'email'
                              }, {
                                name: 'phone_number',
                                type: 'object',
                                properties: []
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }, {
                    name: 'tier1',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'external_id'
                      }, {
                        name: 'external_uid'
                      }, {
                        name: 'name'
                      }, {
                        name: 'tax_id'
                      }, {
                        name: 'contact_info',
                        type: 'object',
                        properties: [
                          {
                            name: 'address_line1'
                          }, {
                            name: 'address_line2'
                          }, {
                            name: 'city'
                          }, {
                            name: 'state'
                          }, {
                            name: 'postal_code'
                          }, {
                            name: 'country'
                          }, {
                            name: 'contact',
                            type: 'object',
                            properties: [
                              {
                                name: 'first_name'
                              }, {
                                name: 'last_name'
                              }, {
                                name: 'email'
                              }, {
                                name: 'phone_number',
                                type: 'object',
                                properties: []
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              }, {
                name: 'marketplace',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }, {
                    name: 'icon'
                  }
                ]
              }, {
                name: 'contract',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }
                ]
              }, {
                name: 'billing',
                type: 'object',
                properties: [
                  {
                    name: 'period',
                    type: 'object',
                    properties: [
                      {
                        name: 'delta'
                      }, {
                        name: 'uom'
                      }
                    ]
                  }, {
                    name: 'next_date'
                  }, {
                    name: 'anniversary',
                    type: 'object',
                    properties: [
                      {
                        name: 'day'
                      }
                    ]
                  }
                ]
              }
            ]
          }, {
            name: 'items',
            type: 'array',
            properties: [
              {
                name: 'id'
              }, {
                name: 'global_id'
              }, {
                name: 'display_name'
              }, {
                name: 'mpn'
              }, {
                name: 'item_type'
              }, {
                name: 'period'
              }, {
                name: 'quantity'
              }, {
                name: 'type'
              }, {
                name: 'billing',
                type: 'object',
                properties: [
                  {
                    name: 'cycle_number'
                  }
                ]
              }
            ]
          }, {
            name: 'attributes',
            type: 'object',
            properties: []
          }, {
            name: 'period',
            type: 'object',
            properties: [
              {
                name: 'from'
              }, {
                name: 'to'
              }, {
                name: 'delta'
              }, {
                name: 'uom'
              }
            ]
          }
        ]
      end
    },

    products_response: {
      fields: lambda do
        [
          {
            name: 'products_response',
            type: 'array',
            properties: [
              {
                name: 'id'
              }, {
                name: 'name'
              }, {
                name: 'icon'
              }, {
                name: 'status'
              }, {
                name: 'short_description'
              }, {
                name: 'detailed_description'
              }, {
                name: 'configurations',
                type: 'object',
                properties: [
                  {
                    name: 'suspend_resume_supported'
                  }, {
                    name: 'requires_reseller_information'
                  }
                ]
              }, {
                name: 'customer_ui_settings',
                type: 'object',
                properties: [
                  {
                    name: 'description'
                  }, {
                    name: 'getting_started'
                  }, {
                    name: 'download_links',
                    type: 'array',
                    properties: [
                      {
                        name: 'title'
                      }, {
                        name: 'url'
                      }, {
                        name: 'visible_for'
                      }, {
                        name: 'title'
                      }, {
                        name: 'url'
                      }, {
                        name: 'visible_for'
                      }
                    ]
                  }, {
                    name: 'documents',
                    type: 'array',
                    properties: [
                      {
                        name: 'title'
                      }, {
                        name: 'url'
                      }
                    ]
                  }, {
                    name: 'languages',
                    type: 'array'
                  }, {
                    name: 'provisioning_message'
                  }, {
                    name: 'action',
                    type: 'object',
                    properties: [
                      {
                        name: 'url'
                      }, {
                        name: 'jwt_secret'
                      }
                    ]
                  }
                ]
              }, {
                name: 'category',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }
                ]
              }, {
                name: 'published_at'
              }, {
                name: 'owner',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }, {
                    name: 'icon'
                  }
                ]
              }, {
                name: 'latest'
              }, {
                name: 'media',
                type: 'object',
                properties: [
                  {
                    name: 'position'
                  }, {
                    name: 'id'
                  }, {
                    name: 'type'
                  }, {
                    name: 'thumbnail'
                  }, {
                    name: 'url'
                  }
                ]
              }, {
                name: 'usage_rule',
                type: 'object',
                properties: [
                  {
                    name: 'enabled'
                  }
                ]
              }, {
                name: 'stats',
                type: 'object',
                properties: [
                  {
                    name: 'versions'
                  }
                ]
              }, {
                name: 'capabilities',
                type: 'object',
                properties: [
                  {
                    name: 'ppu'
                  }, {
                    name: 'reservation',
                    type: 'object',
                    properties: [
                      {
                        name: 'consumption'
                      }
                    ]
                  }, {
                    name: 'cart',
                    type: 'object',
                    properties: [
                      {
                        name: 'validation'
                      }
                    ]
                  }, {
                    name: 'inquiring',
                    type: 'object',
                    properties: [
                      {
                        name: 'validation'
                      }
                    ]
                  }, {
                    name: 'tiers',
                    type: 'object',
                    properties: [
                      {
                        name: 'updates'
                      }, {
                        name: 'configs'
                      }, {
                        name: 'validation'
                      }
                    ]
                  }, {
                    name: 'subscription',
                    type: 'object',
                    properties: [
                      {
                        name: 'cancel',
                        type: 'object',
                        properties: [
                          {
                            name: 'scheduling'
                          }
                        ]
                      }, {
                        name: 'change',
                        type: 'object',
                        properties: [
                          {
                            name: 'editable_ordering_parameters'
                          }, {
                            name: 'validation'
                          }, {
                            name: 'inquiring_validation'
                          }, {
                            name: 'scheduling'
                          }
                        ]
                      }, {
                        name: 'purchase',
                        type: 'object',
                        properties: [
                          {
                            name: 'scheduling'
                          }
                        ]
                      }, {
                        name: 'resume',
                        type: 'object',
                        properties: [
                          {
                            name: 'scheduling'
                          }
                        ]
                      }, {
                        name: 'suspend',
                        type: 'object',
                        properties: [
                          {
                            name: 'scheduling'
                          }
                        ]
                      }, {
                        name: 'hold'
                      }, {
                        name: 'schema'
                      }
                    ]
                  }
                ]
              }, {
                name: 'visibility',
                type: 'object',
                properties: [
                  {
                    name: 'owner'
                  }, {
                    name: 'listing'
                  }, {
                    name: 'syndication'
                  }, {
                    name: 'catalog'
                  }
                ]
              }, {
                name: 'changes_description'
              }, {
                name: 'public'
              }, {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      end
    },

    listing_requests: {
      fields: lambda do
                [
                  {
                    name: 'listing_requests',
                    type: 'array',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'type'
                      }, {
                        name: 'state'
                      }, {
                        name: 'product',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'icon'
                          }, {
                            name: 'name'
                          }, {
                            name: 'version'
                          }
                        ]
                      }, {
                        name: 'listing',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'status'
                          }, {
                            name: 'contract',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              }, {
                                name: 'type'
                              }, {
                                name: 'name'
                              }, {
                                name: 'marketplace',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'id'
                                  }, {
                                    name: 'name'
                                  }, {
                                    name: 'icon'
                                  }
                                ]
                              }
                            ]
                          }, {
                            name: 'product',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              }, {
                                name: 'icon'
                              }, {
                                name: 'name'
                              }, {
                                name: 'status'
                              }, {
                                name: 'version'
                              }
                            ]
                          }, {
                            name: 'created'
                          }, {
                            name: 'updated'
                          }, {
                            name: 'vendor',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              }, {
                                name: 'name'
                              }, {
                                name: 'icon'
                              }
                            ]
                          }, {
                            name: 'provider',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              }, {
                                name: 'name'
                              }
                            ]
                          }, {
                            name: 'upgrade_available'
                          }
                        ]
                      }, {
                        name: 'creator',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'name'
                          }
                        ]
                      }, {
                        name: 'created'
                      }, {
                        name: 'updated'
                      }, {
                        name: 'events',
                        type: 'object',
                        properties: [
                          {
                            name: 'created',
                            type: 'object',
                            properties: [
                              {
                                name: 'at'
                              }, {
                                name: 'by',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'id'
                                  }, {
                                    name: 'name'
                                  }
                                ]
                              }
                            ]
                          }, {
                            name: 'updated',
                            type: 'object',
                            properties: [
                              {
                                name: 'at'
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              end
    },
    tcr_response: {
      fields: lambda do
        [
          {
            name: 'config-requests',
            type: 'array',
            properties: [
              {
                name: 'error_code'
              }, {
                name: 'errors',
                type: 'array'
              }, {
                name: 'id'
              }, {
                name: 'type'
              }, {
                name: 'status'
              }, {
                name: 'configuration',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }, {
                    name: 'account',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }, {
                        name: 'type'
                      }, {
                        name: 'external_id'
                      }, {
                        name: 'external_uid'
                      }, {
                        name: 'contact_info',
                        type: 'object',
                        properties: [
                          {
                            name: 'address_line1'
                          }, {
                            name: 'address_line2'
                          }, {
                            name: 'city'
                          }, {
                            name: 'state'
                          }, {
                            name: 'postal_code'
                          }, {
                            name: 'country'
                          }, {
                            name: 'contact',
                            type: 'object',
                            properties: [
                              {
                                name: 'first_name'
                              }, {
                                name: 'last_name'
                              }, {
                                name: 'email'
                              }, {
                                name: 'phone_number',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'country_code'
                                  }, {
                                    name: 'area_code'
                                  }, {
                                    name: 'phone_number'
                                  }, {
                                    name: 'extension'
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }, {
                    name: 'product',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'icon'
                      }, {
                        name: 'name'
                      }, {
                        name: 'status'
                      }
                    ]
                  }, {
                    name: 'tier_level'
                  }, {
                    name: 'connection',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'type'
                      }, {
                        name: 'status'
                      }, {
                        name: 'provider',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'name'
                          }
                        ]
                      }, {
                        name: 'vendor',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'name'
                          }, {
                            name: 'icon'
                          }
                        ]
                      }, {
                        name: 'created_at'
                      }
                    ]
                  }, {
                    name: 'events',
                    type: 'object',
                    properties: [
                      {
                        name: 'created',
                        type: 'object',
                        properties: [
                          {
                            name: 'at'
                          }, {
                            name: 'by',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              }, {
                                name: 'name'
                              }
                            ]
                          }
                        ]
                      }, {
                        name: 'updated',
                        type: 'object',
                        properties: [
                          {
                            name: 'at'
                          }, {
                            name: 'by',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              }, {
                                name: 'name'
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }, {
                    name: 'params',
                    type: 'array',
                    properties: [
                      {
                        name: 'value'
                      }, {
                        name: 'title'
                      }, {
                        name: 'description'
                      }, {
                        name: 'type'
                      }, {
                        name: 'scope'
                      }, {
                        name: 'phase'
                      }, {
                        name: 'hint'
                      }, {
                        name: 'placeholder'
                      }, {
                        name: 'constraints',
                        type: 'object',
                        properties: [
                          {
                            name: 'required'
                          }, {
                            name: 'hidden'
                          }, {
                            name: 'unique'
                          }
                        ]
                      }, {
                        name: 'id'
                      }, {
                        name: 'value'
                      }, {
                        name: 'structured_value',
                        type: 'object',
                        properties: []
                      }, {
                        name: 'title'
                      }, {
                        name: 'description'
                      }, {
                        name: 'type'
                      }, {
                        name: 'scope'
                      }, {
                        name: 'phase'
                      }, {
                        name: 'hint'
                      }, {
                        name: 'constraints',
                        type: 'object',
                        properties: [
                          {
                            name: 'required'
                          }, {
                            name: 'hidden'
                          }, {
                            name: 'unique'
                          }
                        ]
                      }, {
                        name: 'id'
                      }
                    ]
                  }, {
                    name: 'template',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }, {
                        name: 'representation'
                      }
                    ]
                  }, {
                    name: 'open_request',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }
                    ]
                  }, {
                    name: 'status'
                  }, {
                    name: 'contract',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }, {
                        name: 'type'
                      }
                    ]
                  }, {
                    name: 'marketplace',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }, {
                        name: 'icon'
                      }
                    ]
                  }
                ]
              }, {
                name: 'previous_approved_request',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }
                ]
              }, {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }, {
                        name: 'by',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'name'
                          }
                        ]
                      }
                    ]
                  }, {
                    name: 'updated',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }, {
                        name: 'by',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'name'
                          }
                        ]
                      }
                    ]
                  }, {
                    name: 'pended',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }, {
                        name: 'by',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'name'
                          }
                        ]
                      }
                    ]
                  }
                ]
              }, {
                name: 'params',
                type: 'array',
                properties: [
                  {
                    name: 'value'
                  }, {
                    name: 'title'
                  }, {
                    name: 'description'
                  }, {
                    name: 'type'
                  }, {
                    name: 'scope'
                  }, {
                    name: 'phase'
                  }, {
                    name: 'hint'
                  }, {
                    name: 'placeholder'
                  }, {
                    name: 'constraints',
                    type: 'object',
                    properties: [
                      {
                        name: 'required'
                      }, {
                        name: 'hidden'
                      }, {
                        name: 'unique'
                      }
                    ]
                  }, {
                    name: 'id'
                  }, {
                    name: 'value'
                  }, {
                    name: 'structured_value',
                    type: 'object',
                    properties: [
                      {
                        name: 'hey'
                      }
                    ]
                  }, {
                    name: 'title'
                  }, {
                    name: 'description'
                  }, {
                    name: 'type'
                  }, {
                    name: 'scope'
                  }, {
                    name: 'phase'
                  }, {
                    name: 'hint'
                  }, {
                    name: 'constraints',
                    type: 'object',
                    properties: [
                      {
                        name: 'required'
                      }, {
                        name: 'hidden'
                      }, {
                        name: 'unique'
                      }
                    ]
                  }, {
                    name: 'id'
                  }
                ]
              }, {
                name: 'assignee',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }
                ]
              }, {
                name: 'environment'
              }, {
                name: 'tiers',
                type: 'object',
                properties: [
                  {
                    name: 'tier1'
                  }, {
                    name: 'tier2',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }, {
                        name: 'type'
                      }, {
                        name: 'external_id'
                      }, {
                        name: 'external_uid'
                      }, {
                        name: 'contact_info',
                        type: 'object',
                        properties: [
                          {
                            name: 'address_line1'
                          }, {
                            name: 'address_line2'
                          }, {
                            name: 'city'
                          }, {
                            name: 'state'
                          }, {
                            name: 'postal_code'
                          }, {
                            name: 'country'
                          }, {
                            name: 'contact',
                            type: 'object',
                            properties: [
                              {
                                name: 'first_name'
                              }, {
                                name: 'last_name'
                              }, {
                                name: 'email'
                              }, {
                                name: 'phone_number',
                                type: 'object',
                                properties: [
                                  {
                                    name: 'country_code'
                                  }, {
                                    name: 'area_code'
                                  }, {
                                    name: 'phone_number'
                                  }, {
                                    name: 'extension'
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      end
    },

    tar_response: {
      fields: lambda do
        [
          {
            name: 'account_requests',
            type: 'array',
            properties: [
              {
                name: 'id'
              }, {
                name: 'type'
              }, {
                name: 'status'
              },
              {
                name: 'account',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'version'
                  }, {
                    name: 'name'
                  }, {
                    name: 'type'
                  }, {
                    name: 'external_id'
                  }, {
                    name: 'external_uid'
                  }, {
                    name: 'owner',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }
                    ]
                  }, {
                    name: 'scopes',
                    type: 'array'
                  }, {
                    name: 'hub',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      }, {
                        name: 'name'
                      }
                    ]
                  }, {
                    name: 'tax_id'
                  }, {
                    name: 'contact_info',
                    type: 'object',
                    properties: [
                      {
                        name: 'address_line1'
                      }, {
                        name: 'address_line2'
                      }, {
                        name: 'city'
                      }, {
                        name: 'state'
                      }, {
                        name: 'postal_code'
                      }, {
                        name: 'country'
                      }, {
                        name: 'contact',
                        type: 'object',
                        properties: [
                          {
                            name: 'first_name'
                          }, {
                            name: 'last_name'
                          }, {
                            name: 'email'
                          }, {
                            name: 'phone_number',
                            type: 'object',
                            properties: [
                              {
                                name: 'country_code'
                              }, {
                                name: 'area_code'
                              }, {
                                name: 'phone_number'
                              }, {
                                name: 'extension'
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }, {
                    name: 'events',
                    type: 'object',
                    properties: [
                      {
                        name: 'created',
                        type: 'object',
                        properties: [
                          {
                            name: 'at'
                          }, {
                            name: 'by',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              }, {
                                name: 'name'
                              }
                            ]
                          }
                        ]
                      }, {
                        name: 'updated',
                        type: 'object',
                        properties: [
                          {
                            name: 'at'
                          }
                        ]
                      }
                    ]
                  }
                ]
              }, {
                name: 'vendor',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }, {
                    name: 'icon'
                  }
                ]
              }, {
                name: 'provider',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }
                ]
              }, {
                name: 'product',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'icon'
                  }, {
                    name: 'name'
                  }, {
                    name: 'status'
                  }
                ]
              }, {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }, {
                        name: 'by',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          }, {
                            name: 'name'
                          }
                        ]
                      }
                    ]
                  }, {
                    name: 'updated',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      end
    },

    ta_response: {
      fields: lambda do
        [
          {
            name: 'accounts',
            type: 'array',
            properties: [
              {
                name: 'id'
              },
              { name: 'version' },
              { name: 'name' },
              { name: 'type' },
              { name: 'external_id' },
              { name: 'external_uid' },
              {
                name: 'parent',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }, { name: 'external_id' }]
              },
              {
                name: 'owner',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }]
              },
              { name: 'scopes', type: 'array' },
              {
                name: 'hub',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }]
              },
              { name: 'tax_id' },
              {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      { name: 'at' },
                      {
                        name: 'by',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      }
                    ]
                  },
                  {
                    name: 'updated',
                    type: 'object',
                    properties: [
                      { name: 'at' },
                      {
                        name: 'by',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      }
                    ]
                  }
                ]
              },
              {
                name: 'contact_info',
                type: 'object',
                properties: [
                  { name: 'address_line1' },
                  { name: 'address_line2' },
                  { name: 'city' },
                  { name: 'state' },
                  { name: 'postal_code' },
                  { name: 'country' },
                  {
                    name: 'contact',
                    type: 'object',
                    properties: [
                      { name: 'first_name' },
                      { name: 'last_name' },
                      { name: 'email' },
                      {
                        name: 'phone_number',
                        type: 'object',
                        properties: [
                          { name: 'country_code' },
                          { name: 'area_code' },
                          { name: 'phone_number' },
                          { name: 'extension' }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      end
    },

    fr_response: {
      fields: lambda do
        [
          { name: 'id' },
          { name: 'type' },
          { name: 'error_code' },
          { name: 'note' },
          { name: 'status' },
          { name: 'params_form_url' },
          {
            name: 'asset', type: 'object', properties: [
              { name: 'id' },
              { name: 'external_id' },
              { name: 'external_uid' }
            ]
          },
          { name: 'errors', type: 'array' },

          {
            name: 'external_uids', type: 'object', properties: [
              { name: 'asset_external_uid' },
              { name: 'customer' },
              { name: 'tier1' },
              { name: 'tier2' },
              { name: 'tier3' },
              { name: 'tier4' },
              { name: 'tier5' }
            ]
          }
        ]
      end
    },
    usage_records: {
      fields: lambda do
        [
          {
            name: 'records',
            type: 'array',
            properties: [
              {
                name: 'id'
              }, {
                name: 'start_date'
              }, {
                name: 'end_date'
              }, {
                name: 'product_id'
              }, {
                name: 'external_billing_id'
              }, {
                name: 'external_billing_note'
              }, {
                name: 'item',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'local_id'
                  }, {
                    name: 'mpn'
                  }, {
                    name: 'name'
                  }
                ]
              }, {
                name: 'asset',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'external_id'
                  }, {
                    name: 'external_uid'
                  }
                ]
              }, {
                name: 'multiplier'
              }, {
                name: 'usage'
              }, {
                name: 'status'
              }, {
                name: 'closed_at'
              }, {
                name: 'closed_by'
              }, {
                name: 'params',
                type: 'array',
                properties: []
              }, {
                name: 'item_id'
              }, {
                name: 'asset_id'
              }, {
                name: 'usagefile',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  }, {
                    name: 'name'
                  }, {
                    name: 'schema'
                  }
                ]
              }, {
                name: 'resource_local_id'
              }, {
                name: 'asset_external_id'
              }, {
                name: 'asset_external_uid'
              }
            ]
          }
        ]
      end
    },
    usage_file: {
      fields: lambda do
        [
          {
            name: 'id'
          },
          {
            name: 'name'
          },
          {
            name: 'status'
          },
          {
            name: 'vendor',
            type: 'object',
            properties: [
              {
                name: 'id'
              },
              {
                name: 'name'
              }
            ]
          },
          {
            name: 'provider',
            type: 'object',
            properties: [
              {
                name: 'id'
              },
              {
                name: 'name'
              }
            ]
          },
          {
            name: 'environment'
          },
          {
            name: 'marketplace',
            type: 'object',
            properties: [
              {
                name: 'id'
              },
              {
                name: 'name'
              },
              {
                name: 'icon'
              }
            ]
          },
          {
            name: 'contract',
            type: 'object',
            properties: [
              {
                name: 'id'
              },
              {
                name: 'name'
              }
            ]
          },
          {
            name: 'product',
            type: 'object',
            properties: [
              {
                name: 'id'
              },
              {
                name: 'name'
              },
              {
                name: 'icon'
              }
            ]
          },
          {
            name: 'acceptance_note'
          },
          {
            name: 'schema'
          },
          {
            name: 'period',
            type: 'object',
            properties: [
              {
                name: 'from'
              },
              {
                name: 'to'
              }
            ]
          },
          {
            name: 'stats',
            type: 'object',
            properties: [
              {
                name: 'uploaded'
              },
              {
                name: 'validated'
              },
              {
                name: 'pending'
              },
              {
                name: 'accepted'
              },
              {
                name: 'closed'
              }
            ]
          },
          {
            name: 'events',
            type: 'object',
            properties: [
              {
                name: 'created',
                type: 'object',
                properties: [
                  {
                    name: 'at'
                  },
                  {
                    name: 'by',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      },
                      {
                        name: 'name'
                      }
                    ]
                  }
                ]
              },
              {
                name: 'accepted',
                type: 'object',
                properties: [
                  {
                    name: 'at'
                  },
                  {
                    name: 'by',
                    type: 'object',
                    properties: [
                      {
                        name: 'name'
                      }
                    ]
                  }
                ]
              },
              {
                name: 'closed',
                type: 'object',
                properties: [
                  {
                    name: 'at'
                  },
                  {
                    name: 'by',
                    type: 'object',
                    properties: [
                      {
                        name: 'name'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      end
    },
    request: {
      fields: lambda do
        [
          { name: 'id' },
          { name: 'type' },
          { name: 'note' },
          { name: 'reason' },
          { name: 'effective_date' },
          { name: 'created' },
          { name: 'updated' },
          { name: 'answered' },
          { name: 'reason' },
          { name: 'assignee' },
          { name: 'activation_key' },
          { name: 'status' },
          {
            name: 'asset', type: 'object', properties: [
              { name: 'id' },
              { name: 'status' },
              { name: 'external_id' },
              { name: 'external_uid' },
              {
                name: 'product', type: 'object', properties: [
                  { name: 'id' },
                  { name: 'icon' },
                  { name: 'name' },
                  { name: 'status' }
                ]
              },
              # skipped connection and events structures
              {
                name: 'items', type: 'array', properties: [
                  { name: 'id' },
                  { name: 'global_id' },
                  { name: 'mpn' },
                  { name: 'old_quantity' },
                  { name: 'quantity' },
                  { name: 'type' },
                  { name: 'display_name' },
                  { name: 'period' },
                  { name: 'item_type' }
                ]
              },
              # skipped params array, tiers and configuration structures
              {
                name: 'marketplace', type: 'object', properties: [
                  { name: 'id' },
                  { name: 'name' },
                  { name: 'icon' }
                ]
              }
              # skipped contract structure
            ]
          }
        ]
      end
    },

    conversations_messages_response: {
      fields: lambda do
        [
          { name: 'id' },
          { name: 'conversation' },
          {
            name: 'account',
            type: 'object',
            properties: [{ name: 'id' }, { name: 'name' }, { name: 'icon' }]
          },
          { name: 'created' },
          {
            name: 'creator',
            type: 'object',
            properties: [{ name: 'id' }, { name: 'name' }]
          },
          { name: 'text' },
          { name: 'type' },
          {
            name: 'events',
            type: 'object',
            properties: [
              {
                name: 'created',
                type: 'object',
                properties: [
                  { name: 'at' },
                  {
                    name: 'by',
                    type: 'object',
                    properties: [{ name: 'id' }, { name: 'name' }]
                  }
                ]
              },
              { name: 'updated', type: 'object', properties: [{ name: 'at' }] }
            ]
          }
        ]
      end
    },

    helpdesk_case_response: {
      fields: lambda do
        [
          { name: 'id' },
          {
            name: 'product',
            type: 'object',
            properties: [{ name: 'id' }, { name: 'name' }, { name: 'icon' }]
          },
          { name: 'subject' },
          { name: 'description' },
          { name: 'priority' },
          { name: 'state' },
          { name: 'type' },
          {
            name: 'issuer',
            type: 'object',
            properties: [
              {
                name: 'account',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }, { name: 'icon' }]
              },
              {
                name: 'agent',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }]
              },
              {
                name: 'recipients',
                type: 'array',
                properties: [{ name: 'id' }, { name: 'name' }]
              }
            ]
          },
          {
            name: 'receiver',
            type: 'object',
            properties: [
              {
                name: 'account',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }, { name: 'icon' }]
              },
              { name: 'recipients', type: 'array' }
            ]
          },
          {
            name: 'events',
            type: 'object',
            properties: [
              {
                name: 'created',
                type: 'object',
                properties: [
                  { name: 'at' },
                  {
                    name: 'by',
                    type: 'object',
                    properties: [{ name: 'id' }, { name: 'name' }]
                  }
                ]
              },
              {
                name: 'updated',
                type: 'object',
                properties: [
                  { name: 'at' },
                  {
                    name: 'by',
                    type: 'object',
                    properties: [{ name: 'id' }, { name: 'name' }]
                  }
                ]
              },
              {
                name: 'pending',
                type: 'object',
                properties: [
                  { name: 'at' },
                  {
                    name: 'by',
                    type: 'object',
                    properties: [{ name: 'id' }, { name: 'name' }]
                  }
                ]
              }
            ]
          }
        ]
      end
    },

    hc_comments_response: {
      fields: lambda do
        [
          {
            name: 'helpdesk_case_comments',
            type: 'array',
            properties: [
              { name: 'id' },
              { name: 'conversation' },
              {
                name: 'account',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }, { name: 'icon' }]
              },
              { name: 'created' },
              {
                name: 'creator',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }]
              },
              { name: 'text' },
              { name: 'type' },
              {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      { name: 'at' },
                      {
                        name: 'by',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      }
                    ]
                  },
                  { name: 'updated', type: 'object', properties: [{ name: 'at' }] }
                ]
              }
            ]
          }
        ]
      end
    },

    conversations_response: {
      fields: lambda do
        [
          {
            name: 'conversations',
            type: 'array',
            properties: [
              { name: 'id' },
              { name: 'instance_id' },
              { name: 'topic' },
              { name: 'type' },
              { name: 'status' },
              {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      { name: 'at' },
                      {
                        name: 'by',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      }
                    ]
                  },
                  {
                    name: 'updated',
                    type: 'object',
                    properties: [
                      { name: 'at' },
                      {
                        name: 'by',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      }
                    ]
                  }
                ]
              },
              {
                name: 'accounts',
                type: 'array',
                properties: [
                  { name: 'id' },
                  { name: 'name' },
                  { name: 'icon' },
                  { name: 'id' },
                  { name: 'name' }
                ]
              },
              {
                name: 'creator',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }]
              },
              { name: 'created' }
            ]
          }
        ]
      end
    },

    expanded_request: {
      fields: lambda do
        [
          { name: 'id' },
          { name: 'type' },
          { name: 'note' },
          {
            name: 'asset',
            type: 'object',
            properties: [
              { name: 'id' },
              { name: 'status' },
              { name: 'external_id' },
              { name: 'external_uid' },
              {
                name: 'product',
                type: 'object',
                properties: [
                  { name: 'id' },
                  { name: 'icon' },
                  { name: 'name' },
                  { name: 'status' }
                ]
              },
              {
                name: 'connection',
                type: 'object',
                properties: [
                  { name: 'id' },
                  { name: 'type' },
                  { name: 'status' },
                  {
                    name: 'provider',
                    type: 'object',
                    properties: [{ name: 'id' }, { name: 'name' }]
                  },
                  {
                    name: 'vendor',
                    type: 'object',
                    properties: [{ name: 'id' }, { name: 'name' }, { name: 'icon' }]
                  },
                  { name: 'created_at' },
                  {
                    name: 'hub',
                    type: 'object',
                    properties: [{ name: 'id' }, { name: 'name' }]
                  }
                ]
              },
              {
                name: 'events',
                type: 'object',
                properties: [
                  { name: 'created', type: 'object', properties: [{ name: 'at' }] },
                  { name: 'updated', type: 'object', properties: [{ name: 'at' }] }
                ]
              },
              {
                name: 'items',
                type: 'array',
                properties: [
                  { name: 'id' },
                  { name: 'global_id' },
                  { name: 'mpn' },
                  { name: 'old_quantity' },
                  { name: 'quantity' },
                  { name: 'type' },
                  { name: 'display_name' },
                  { name: 'period' },
                  { name: 'item_type' }
                ]
              },
              {
                name: 'params',
                type: 'array',
                properties: [
                  { name: 'id' },
                  { name: 'name' },
                  { name: 'type' },
                  { name: 'phase' },
                  { name: 'description' },
                  { name: 'value' },
                  { name: 'value_error' },
                  { name: 'title' },
                  {
                    name: 'constraints',
                    type: 'object',
                    properties: [
                      {
                        name: 'default',
                        type: 'object',
                        properties: [{ name: 'country' }]
                      },
                      { name: 'meta', type: 'object', properties: [] },
                      { name: 'required' }
                    ]
                  },
                  {
                    name: 'structured_value',
                    type: 'object',
                    properties: [
                      { name: 'address_line1' },
                      { name: 'address_line2' },
                      { name: 'city' },
                      { name: 'state' },
                      { name: 'postal_code' },
                      { name: 'country' }
                    ]
                  }
                ]
              },
              {
                name: 'tiers',
                type: 'object',
                properties: [
                  {
                    name: 'customer',
                    type: 'object',
                    properties: [
                      { name: 'id' },
                      { name: 'version' },
                      { name: 'name' },
                      { name: 'type' },
                      { name: 'external_id' },
                      { name: 'external_uid' },
                      {
                        name: 'parent',
                        type: 'object',
                        properties: [
                          { name: 'id' },
                          { name: 'name' },
                          { name: 'external_id' }
                        ]
                      },
                      {
                        name: 'owner',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      },
                      { name: 'scopes', type: 'array' },
                      {
                        name: 'hub',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      },
                      { name: 'tax_id' },
                      {
                        name: 'events',
                        type: 'object',
                        properties: [
                          {
                            name: 'created',
                            type: 'object',
                            properties: [
                              { name: 'at' },
                              {
                                name: 'by',
                                type: 'object',
                                properties: [{ name: 'id' }, { name: 'name' }]
                              }
                            ]
                          },
                          {
                            name: 'updated',
                            type: 'object',
                            properties: [
                              { name: 'at' },
                              {
                                name: 'by',
                                type: 'object',
                                properties: [{ name: 'id' }, { name: 'name' }]
                              }
                            ]
                          }
                        ]
                      },
                      {
                        name: 'contact_info',
                        type: 'object',
                        properties: [
                          { name: 'address_line1' },
                          { name: 'address_line2' },
                          { name: 'city' },
                          { name: 'state' },
                          { name: 'postal_code' },
                          { name: 'country' },
                          {
                            name: 'contact',
                            type: 'object',
                            properties: [
                              { name: 'first_name' },
                              { name: 'last_name' },
                              { name: 'email' },
                              {
                                name: 'phone_number',
                                type: 'object',
                                properties: [
                                  { name: 'country_code' },
                                  { name: 'area_code' },
                                  { name: 'phone_number' },
                                  { name: 'extension' }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  },
                  {
                    name: 'tier1',
                    type: 'object',
                    properties: [
                      { name: 'id' },
                      { name: 'version' },
                      { name: 'name' },
                      { name: 'type' },
                      { name: 'external_id' },
                      { name: 'external_uid' },
                      {
                        name: 'parent',
                        type: 'object',
                        properties: [
                          { name: 'id' },
                          { name: 'name' },
                          { name: 'external_id' }
                        ]
                      },
                      {
                        name: 'owner',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      },
                      { name: 'scopes', type: 'array' },
                      {
                        name: 'hub',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      },
                      { name: 'tax_id' },
                      {
                        name: 'events',
                        type: 'object',
                        properties: [
                          {
                            name: 'created',
                            type: 'object',
                            properties: [
                              { name: 'at' },
                              {
                                name: 'by',
                                type: 'object',
                                properties: [{ name: 'id' }, { name: 'name' }]
                              }
                            ]
                          },
                          {
                            name: 'updated',
                            type: 'object',
                            properties: [
                              { name: 'at' },
                              {
                                name: 'by',
                                type: 'object',
                                properties: [{ name: 'id' }, { name: 'name' }]
                              }
                            ]
                          }
                        ]
                      },
                      {
                        name: 'contact_info',
                        type: 'object',
                        properties: [
                          { name: 'address_line1' },
                          { name: 'address_line2' },
                          { name: 'city' },
                          { name: 'state' },
                          { name: 'postal_code' },
                          { name: 'country' },
                          {
                            name: 'contact',
                            type: 'object',
                            properties: [
                              { name: 'first_name' },
                              { name: 'last_name' },
                              { name: 'email' },
                              {
                                name: 'phone_number',
                                type: 'object',
                                properties: [
                                  { name: 'country_code' },
                                  { name: 'area_code' },
                                  { name: 'phone_number' },
                                  { name: 'extension' }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  },
                  {
                    name: 'tier2',
                    type: 'object',
                    properties: [
                      { name: 'id' },
                      { name: 'version' },
                      { name: 'name' },
                      { name: 'type' },
                      { name: 'external_id' },
                      { name: 'external_uid' },
                      {
                        name: 'parent',
                        type: 'object',
                        properties: [
                          { name: 'id' },
                          { name: 'name' },
                          { name: 'external_id' }
                        ]
                      },
                      {
                        name: 'owner',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      },
                      { name: 'scopes', type: 'array' },
                      {
                        name: 'hub',
                        type: 'object',
                        properties: [{ name: 'id' }, { name: 'name' }]
                      },
                      {
                        name: 'events',
                        type: 'object',
                        properties: [
                          {
                            name: 'created',
                            type: 'object',
                            properties: [
                              { name: 'at' },
                              {
                                name: 'by',
                                type: 'object',
                                properties: [{ name: 'id' }, { name: 'name' }]
                              }
                            ]
                          },
                          {
                            name: 'updated',
                            type: 'object',
                            properties: [
                              { name: 'at' },
                              {
                                name: 'by',
                                type: 'object',
                                properties: [{ name: 'id' }, { name: 'name' }]
                              }
                            ]
                          }
                        ]
                      },
                      {
                        name: 'contact_info',
                        type: 'object',
                        properties: [
                          { name: 'address_line1' },
                          { name: 'address_line2' },
                          { name: 'city' },
                          { name: 'state' },
                          { name: 'postal_code' },
                          { name: 'country' },
                          {
                            name: 'contact',
                            type: 'object',
                            properties: [
                              { name: 'first_name' },
                              { name: 'last_name' },
                              { name: 'email' },
                              {
                                name: 'phone_number',
                                type: 'object',
                                properties: [
                                  { name: 'country_code' },
                                  { name: 'area_code' },
                                  { name: 'phone_number' },
                                  { name: 'extension' }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              },
              {
                name: 'configuration',
                type: 'object',
                properties: [{ name: 'params', type: 'array' }]
              },
              {
                name: 'marketplace',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'name' }, { name: 'icon' }]
              },
              {
                name: 'contract',
                type: 'object',
                properties: [{ name: 'id' }, { name: 'type' }, { name: 'name' }]
              }
            ]
          },
          { name: 'reason' },
          { name: 'status' },
          { name: 'created' },
          { name: 'updated' },
          { name: 'answered' },
          {
            name: 'assignee',
            type: 'object',
            properties: [{ name: 'id' }, { name: 'name' }, { name: 'email' }]
          },
          { name: 'activation_key' },
          {
            name: 'template',
            type: 'object',
            properties: [{ name: 'id' }, { name: 'name' }, { name: 'message' }]
          },
          { name: 'previous_approved_request' },
          { name: 'effective_date' },
          { name: 'planned_date' },
          {
            name: 'events',
            type: 'object',
            properties: [
              { name: 'created', type: 'object', properties: [{ name: 'at' }] },
              { name: 'updated', type: 'object', properties: [{ name: 'at' }] }
            ]
          },
          {
            name: 'marketplace',
            type: 'object',
            properties: [{ name: 'id' }, { name: 'name' }, { name: 'icon' }]
          },
          {
            name: 'contract',
            type: 'object',
            properties: [{ name: 'id' }, { name: 'type' }, { name: 'name' }]
          },
          { name: 'params_form_url' }
        ]
      end
    },

    tier_account_request: {
      fields: lambda do
        [
          {
            name: 'account_requests',
            type: 'array',
            properties: [

              {
                name: 'id'
              },
              {
                name: 'type'
              },
              {
                name: 'status'
              },
              {
                name: 'account',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  },
                  {
                    name: 'version'
                  },
                  {
                    name: 'name'
                  },
                  {
                    name: 'type'
                  },
                  {
                    name: 'external_id'
                  },
                  {
                    name: 'external_uid'
                  },
                  {
                    name: 'parent',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      },
                      {
                        name: 'name'
                      },
                      {
                        name: 'external_id'
                      }
                    ]
                  },
                  {
                    name: 'owner',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      },
                      {
                        name: 'name'
                      },
                      {
                        name: 'icon'
                      }
                    ]
                  },
                  {
                    name: 'scopes',
                    type: 'array',
                    properties: [
                      {
                        name: 'None'
                      }
                    ]
                  },
                  {
                    name: 'hub',
                    type: 'object',
                    properties: [
                      {
                        name: 'id'
                      },
                      {
                        name: 'name'
                      }
                    ]
                  },
                  {
                    name: 'tax_id'
                  },
                  {
                    name: 'contact_info',
                    type: 'object',
                    properties: [
                      {
                        name: 'address_line1'
                      },
                      {
                        name: 'address_line2'
                      },
                      {
                        name: 'city'
                      },
                      {
                        name: 'state'
                      },
                      {
                        name: 'postal_code'
                      },
                      {
                        name: 'country'
                      },
                      {
                        name: 'contact',
                        type: 'object',
                        properties: [
                          {
                            name: 'first_name'
                          },
                          {
                            name: 'last_name'
                          },
                          {
                            name: 'email'
                          },
                          {
                            name: 'phone_number',
                            type: 'object',
                            properties: [
                              {
                                name: 'country_code'
                              },
                              {
                                name: 'area_code'
                              },
                              {
                                name: 'phone_number'
                              },
                              {
                                name: 'extension'
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  },
                  {
                    name: 'events',
                    type: 'object',
                    properties: [
                      {
                        name: 'created',
                        type: 'object',
                        properties: [
                          {
                            name: 'at'
                          },
                          {
                            name: 'by',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              },
                              {
                                name: 'name'
                              }
                            ]
                          }
                        ]
                      },
                      {
                        name: 'updated',
                        type: 'object',
                        properties: [
                          {
                            name: 'at'
                          },
                          {
                            name: 'by',
                            type: 'object',
                            properties: [
                              {
                                name: 'id'
                              },
                              {
                                name: 'name'
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              },
              {
                name: 'vendor',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  },
                  {
                    name: 'name'
                  },
                  {
                    name: 'icon'
                  }
                ]
              },
              {
                name: 'provider',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  },
                  {
                    name: 'name'
                  },
                  {
                    name: 'icon'
                  }
                ]
              },
              {
                name: 'product',
                type: 'object',
                properties: [
                  {
                    name: 'id'
                  },
                  {
                    name: 'icon'
                  },
                  {
                    name: 'name'
                  },
                  {
                    name: 'status'
                  }
                ]
              },
              {
                name: 'reason'
              },
              {
                name: 'events',
                type: 'object',
                properties: [
                  {
                    name: 'created',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      },
                      {
                        name: 'by',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          },
                          {
                            name: 'name'
                          }
                        ]
                      }
                    ]
                  },
                  {
                    name: 'updated',
                    type: 'object',
                    properties: [
                      {
                        name: 'at'
                      },
                      {
                        name: 'by',
                        type: 'object',
                        properties: [
                          {
                            name: 'id'
                          },
                          {
                            name: 'name'
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      end
    },
    search_an_asset_response: {
      fields: lambda do
                [
                  {
                    "name": 'id'
                  },
                  {
                    "name": 'status'
                  },
                  {
                    "name": 'external_id'
                  },
                  {
                    "name": 'external_uid'
                  },
                  {
                    "name": 'product',
                    "type": 'object',
                    "properties": [
                      {
                        "name": 'id'
                      },
                      {
                        "name": 'icon'
                      },
                      {
                        "name": 'name'
                      },
                      {
                        "name": 'status'
                      },
                      {
                        "name": 'description'
                      },
                      {
                        "name": 'category',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'id'
                          },
                          {
                            "name": 'name'
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "name": 'connection',
                    "type": 'object',
                    "properties": [
                      {
                        "name": 'id'
                      },
                      {
                        "name": 'provider',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'id'
                          },
                          {
                            "name": 'name'
                          }
                        ]
                      },
                      {
                        "name": 'vendor',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'id'
                          },
                          {
                            "name": 'name'
                          }
                        ]
                      },
                      {
                        "name": 'type'
                      },
                      {
                        "name": 'hub',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'id'
                          },
                          {
                            "name": 'name'
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "name": 'events',
                    "type": 'object',
                    "properties": [
                      {
                        "name": 'created',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'at'
                          }
                        ]
                      },
                      {
                        "name": 'updated',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'at'
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "name": 'items',
                    "type": 'array',
                    "properties": [
                      {
                        "name": 'id'
                      },
                      {
                        "name": 'quantity'
                      }
                    ]
                  },
                  {
                    "name": 'params',
                    "type": 'array',
                    "properties": [
                      {
                        "name": 'id'
                      },
                      {
                        "name": 'title'
                      },
                      {
                        "name": 'description'
                      },
                      {
                        "name": 'value'
                      },
                      {
                        "name": 'value_error'
                      },
                      {
                        "name": 'type'
                      },
                      {
                        "name": 'scope'
                      },
                      {
                        "name": 'phase'
                      },
                      {
                        "name": 'contraints',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'required'
                          },
                          {
                            "name": 'hidden'
                          },
                          {
                            "name": 'unique'
                          },
                          {
                            "name": 'reconciliation'
                          },
                          {
                            "name": 'shared'
                          },
                          {
                            "name": 'choices',
                            "type": 'array',
                            "properties": [
                              {
                                "name": 'label'
                              },
                              {
                                "name": 'value'
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "name": 'tiers',
                    "type": 'object',
                    "properties": [
                      {
                        "name": 'customer',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'external_id'
                          },
                          {
                            "name": 'external_uid'
                          },
                          {
                            "name": 'name'
                          },
                          {
                            "name": 'tax_id'
                          },
                          {
                            "name": 'contact_info',
                            "type": 'object',
                            "properties": [
                              {
                                "name": 'address_line1'
                              },
                              {
                                "name": 'address_line2'
                              },
                              {
                                "name": 'city'
                              },
                              {
                                "name": 'state'
                              },
                              {
                                "name": 'postal_code'
                              },
                              {
                                "name": 'country'
                              },
                              {
                                "name": 'contact',
                                "type": 'object',
                                "properties": [
                                  {
                                    "name": 'first_name'
                                  },
                                  {
                                    "name": 'last_name'
                                  },
                                  {
                                    "name": 'email'
                                  },
                                  {
                                    "name": 'phone_number',
                                    "type": 'object',
                                    "properties": [
                                      {
                                        "name": 'country_code'
                                      },
                                      {
                                        "name": 'area_code'
                                      },
                                      {
                                        "name": 'phone_number'
                                      },
                                      {
                                        "name": 'extension'
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      },
                      {
                        "name": 'tier1',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'external_id'
                          },
                          {
                            "name": 'external_uid'
                          },
                          {
                            "name": 'name'
                          },
                          {
                            "name": 'tax_id'
                          },
                          {
                            "name": 'contact_info',
                            "type": 'object',
                            "properties": [
                              {
                                "name": 'address_line1'
                              },
                              {
                                "name": 'address_line2'
                              },
                              {
                                "name": 'city'
                              },
                              {
                                "name": 'state'
                              },
                              {
                                "name": 'postal_code'
                              },
                              {
                                "name": 'country'
                              },
                              {
                                "name": 'contact',
                                "type": 'object',
                                "properties": [
                                  {
                                    "name": 'first_name'
                                  },
                                  {
                                    "name": 'last_name'
                                  },
                                  {
                                    "name": 'email'
                                  },
                                  {
                                    "name": 'phone_number',
                                    "type": 'object',
                                    "properties": [
                                      {
                                        "name": 'country_code'
                                      },
                                      {
                                        "name": 'area_code'
                                      },
                                      {
                                        "name": 'phone_number'
                                      },
                                      {
                                        "name": 'extension'
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      },
                      {
                        "name": 'tier2',
                        "type": 'object',
                        "properties": [
                          {
                            "name": 'external_id'
                          },
                          {
                            "name": 'external_uid'
                          },
                          {
                            "name": 'name'
                          },
                          {
                            "name": 'tax_id'
                          },
                          {
                            "name": 'contact_info',
                            "type": 'object',
                            "properties": [
                              {
                                "name": 'address_line1'
                              },
                              {
                                "name": 'address_line2'
                              },
                              {
                                "name": 'city'
                              },
                              {
                                "name": 'state'
                              },
                              {
                                "name": 'postal_code'
                              },
                              {
                                "name": 'country'
                              },
                              {
                                "name": 'contact',
                                "type": 'object',
                                "properties": [
                                  {
                                    "name": 'first_name'
                                  },
                                  {
                                    "name": 'last_name'
                                  },
                                  {
                                    "name": 'email'
                                  },
                                  {
                                    "name": 'phone_number',
                                    "type": 'object',
                                    "properties": [
                                      {
                                        "name": 'country_code'
                                      },
                                      {
                                        "name": 'area_code'
                                      },
                                      {
                                        "name": 'phone_number'
                                      },
                                      {
                                        "name": 'extension'
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "name": 'configuration',
                    "type": 'object',
                    "properties": [
                      {
                        "name": 'params',
                        "type": 'array',
                        "properties": [
                          {
                            "name": 'id'
                          },
                          {
                            "name": 'title'
                          },
                          {
                            "name": 'description'
                          },
                          {
                            "name": 'value'
                          },
                          {
                            "name": 'type'
                          },
                          {
                            "name": 'scope'
                          },
                          {
                            "name": 'phase'
                          },
                          {
                            "name": 'contraints',
                            "type": 'object',
                            "properties": [
                              {
                                "name": 'required'
                              },
                              {
                                "name": 'hidden'
                              },
                              {
                                "name": 'unique'
                              },
                              {
                                "name": 'shared'
                              }
                            ]
                          },
                          {
                            "name": 'events',
                            "type": 'object',
                            "properties": [
                              {
                                "name": 'created',
                                "type": 'object',
                                "properties": [
                                  {
                                    "name": 'at'
                                  },
                                  {
                                    "name": 'by',
                                    "type": 'object',
                                    "properties": [
                                      {
                                        "name": 'id'
                                      },
                                      {
                                        "name": 'name'
                                      }
                                    ]
                                  }
                                ]
                              },
                              {
                                "name": 'updated',
                                "type": 'object',
                                "properties": [
                                  {
                                    "name": 'at'
                                  },
                                  {
                                    "name": 'by',
                                    "type": 'object',
                                    "properties": [
                                      {
                                        "name": 'id'
                                      },
                                      {
                                        "name": 'name'
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              end
    },

    custom_action_input: {
      fields: lambda do |_connection, config_fields|
        verb = config_fields['verb']
        input_schema = parse_json(config_fields.dig('input', 'schema') || '[]')
        data_props =
          input_schema.map do |field|
            if config_fields['request_type'] == 'multipart' &&
               field['binary_content'] == 'true'
              field['type'] = 'object'
              field['properties'] = [
                { name: 'file_content', optional: false },
                {
                  name: 'content_type',
                  default: 'text/plain',
                  sticky: true
                },
                { name: 'original_filename', sticky: true }
              ]
            end
            field
          end
        data_props = call('make_schema_builder_fields_sticky', data_props)
        input_data =
          if input_schema.present?
            if input_schema.dig(0, 'type') == 'array' &&
               input_schema.dig(0, 'details', 'fake_array')
              {
                name: 'data',
                type: 'array',
                of: 'object',
                properties: data_props.dig(0, 'properties')
              }
            else
              { name: 'data', type: 'object', properties: data_props }
            end
          end
        [
          {
            name: 'path',
            hint: 'Base URI - path will be appended to this URI. Use absolute URI to override this base URI.',
            optional: false
          },
          if %w[post put patch].include?(verb)
            {
              name: 'request_type',
              default: 'json',
              sticky: true,
              extends_schema: true,
              control_type: 'select',
              pick_list: [
                ['JSON request body', 'json'],
                ['URL encoded form', 'url_encoded_form'],
                ['Mutipart form', 'multipart'],
                ['Raw request body', 'raw']
              ]
            }
          end,

          {
            name: 'response_type',
            default: 'json',
            sticky: false,
            extends_schema: true,
            control_type: 'select',
            pick_list: [['JSON response', 'json'], ['Raw response', 'raw']]
          },
          if %w[get options delete].include?(verb)
            {
              name: 'input',
              label: 'Request URL parameters',
              sticky: true,
              add_field_label: 'Add URL parameter',
              control_type: 'form-schema-builder',
              type: 'object',
              properties: [
                {
                  name: 'schema',
                  sticky: input_schema.blank?,
                  extends_schema: true
                },
                input_data
              ].compact
            }
          else
            {
              name: 'input',
              label: 'Request body parameters',
              sticky: true,
              type: 'object',
              properties:
            if config_fields['request_type'] == 'raw'
              [
                {
                  name: 'data',
                  sticky: true,
                  control_type: 'text-area',
                  type: 'string'
                }
              ]
            else
              [
                {
                  name: 'schema',
                  sticky: input_schema.blank?,
                  extends_schema: true,
                  schema_neutral: true,
                  control_type: 'schema-designer',
                  sample_data_type: 'json_input',
                  custom_properties:
                if config_fields['request_type'] == 'multipart'
                  [
                    {
                      name: 'binary_content',
                      label: 'File attachment',
                      default: false,
                      optional: true,
                      sticky: true,
                      render_input: 'boolean_conversion',
                      parse_output: 'boolean_conversion',
                      control_type: 'checkbox',
                      type: 'boolean'
                    }
                  ]
                end
                },
                input_data
              ].compact
            end
            }
          end,
          {
            name: 'request_headers',
            sticky: false,
            extends_schema: true,
            control_type: 'key_value',
            empty_list_title: 'Does this HTTP request require headers?',
            empty_list_text: 'Refer to the API documentation and add required headers to this HTTP request',
            item_label: 'Header',
            type: 'array',
            of: 'object',
            properties: [{ name: 'key' }, { name: 'value' }]
          },
          unless config_fields['response_type'] == 'raw'
            {
              name: 'output',
              label: 'Response body',
              sticky: true,
              extends_schema: true,
              schema_neutral: true,
              control_type: 'schema-designer',
              sample_data_type: 'json_input'
            }
          end,
          {
            name: 'response_headers',
            sticky: false,
            extends_schema: true,
            schema_neutral: true,
            control_type: 'schema-designer',
            sample_data_type: 'json_input'
          }
        ].compact
      end
    },

    custom_action_output: {
      fields: lambda do |_connection, config_fields|
        response_body = { name: 'body' }
        [
          if config_fields['response_type'] == 'raw'
            response_body
          elsif (output = config_fields['output'])
            output_schema = call('format_schema', parse_json(output))
            if output_schema.dig(0, 'type') == 'array' &&
               output_schema.dig(0, 'details', 'fake_array')
              response_body[:type] = 'array'
              response_body[:properties] = output_schema.dig(0, 'properties')
            else
              response_body[:type] = 'object'
              response_body[:properties] = output_schema
            end
            response_body
          end,
          if (headers = config_fields['response_headers'])
            header_props = parse_json(headers)&.map do |field|
              if field[:name].present?
                field[:name] = field[:name].gsub(/\W/, '_').downcase
              elsif field['name'].present?
                field['name'] = field['name'].gsub(/\W/, '_').downcase
              end
              field
            end
            { name: 'headers', type: 'object', properties: header_props }
          end
        ].compact
      end
    }

  },

  # Reusable methods can be called from object_definitions, picklists or actions
  # See more at https://docs.workato.com/developing-connectors/sdk/sdk-reference/methods.html
  methods: {
    custom_json_input: lambda do |_connection, config_fields, input_name, input_label, input_hint|
      input_schema = parse_json(config_fields.dig(input_name, 'schema') || '[]')
      data_props =
        input_schema.map do |field|
          field
        end
      data_props = call('make_schema_builder_fields_sticky', data_props)
      input_data = { name: 'data', type: 'object', properties: data_props }

      [
        {
          name: input_name,
          label: input_label,
          hint: input_hint,
          sticky: true,
          type: 'object',
          properties:
          [
            {
              name: 'schema',
              sticky: input_schema.blank?,
              extends_schema: true,
              schema_neutral: true,
              control_type: 'schema-designer',
              sample_data_type: 'json_input'
            },
            input_data
          ].compact
        }
      ].compact
    end,

    make_schema_builder_fields_sticky: lambda do |schema|
      schema.map do |field|
        if field['properties'].present?

          field['properties'] = call(
            'make_schema_builder_fields_sticky',
            field['properties']
          )

        end
        field['convert_input'] = 'boolean_conversion' if field['type'] == 'boolean'
        field['sticky'] = true

        field
      end
    end,

    # Formats input/output schema to replace any special characters in name,
    # without changing other attributes (method required for custom action)
    format_schema: lambda do |input|
      input&.map do |field|
        if (props = field[:properties])
          field[:properties] = call('format_schema', props)
        elsif (props = field['properties'])
          field['properties'] = call('format_schema', props)
        end
        if (name = field[:name])
          field[:label] = field[:label].presence || name.labelize
          field[:name] = name.gsub(/\W/) { |spl_chr| "__#{spl_chr.encode_hex}__" }
        elsif (name = field['name'])
          field['label'] = field['label'].presence || name.labelize
          field['name'] = name.gsub(/\W/) { |spl_chr| "__#{spl_chr.encode_hex}__" }
        end
        field
      end
    end,

    # Formats payload to inject any special characters that previously removed
    format_payload: lambda do |payload|
                      case payload
                      when Array
                        payload.map do |array_value|
                          call('format_payload', array_value)
                        end
                      when Hash
                        payload.each_with_object({}) do |(key, value), hash|
                          key = key.gsub(/__\w+__/) do |string|
                            string.gsub(/__/, '').decode_hex.as_utf8
                          end
                          if value.is_a?(Array) || value.is_a?(Hash)
                            value = call(
                              'format_payload',
                              value
                            )
                          end
                          hash[key] = value
                        end
                      end
                    end,

    # Formats response to replace any special characters with valid strings
    # (method required for custom action)
    format_response: lambda do |response|
                       response = response&.compact unless response.is_a?(String) || response
                       case response
                       when Array
                         response.map do |array_value|
                           call('format_response', array_value)
                         end
                       when Hash
                         response.each_with_object({}) do |(key, value), hash|
                           key = key.gsub(/\W/) { |spl_chr| "__#{spl_chr.encode_hex}__" }
                           if value.is_a?(Array) || value.is_a?(Hash)
                             value = call(
                               'format_response',
                               value
                             )
                           end
                           hash[key] = value
                         end
                       else
                         response
                       end
                     end,

    get_maketplace_id: lambda do |_connection, marketplace_name|
                         response = get("/public/v1/marketplaces?name=#{marketplace_name}")
                           .after_error_response(/.*/) do |_, body, _, message|
                           error("#{message}: #{body}")
                         end

                         if response.empty?
                           error("#Marketplace not found: #{marketplace_name}")
                         else
                           marketplace_id = response[0]['id']
                         end

                         marketplace_id
                       end,

    get_tier_external_uid: lambda do |_connection, tier_external_id|
                             response = get("/public/v1/tier/accounts?external_id=#{tier_external_id}")
                               .after_error_response(/.*/) do |_, body, _, message|
                               error("#{message}: #{body}")
                             end

                             tier_external_uid = if response.empty?
                                                   workato.uuid
                                                 else
                                                   response[0]['external_uid']
                                                 end

                             tier_external_uid
                           end,

    get_conversations_id: lambda do |_connection, case_id|
                            response = get("/public/v1/conversations?instance_id=#{case_id}")
                              .after_error_response(/.*/) do |_, body, _, message|
                              error("#{message}: #{body}")
                            end

                            if response.empty?
                              error("#Conversations not found for this Case ID #{case_id}")
                            else
                              conversations_id = response[0]['id']
                            end

                            conversations_id
                          end,

    reconstruct_timestamp_name: lambda do |input_name, period|
                                  res = input_name

                                  si = res.length - period.length - 1
                                  res = res[0, si]

                                  res = input_name if res.empty?
                                  res
                                end,

    form_query_params: lambda do |input, q_params, operators|
                         input.each do |key, value|
                           oprt = 'in'
                           skip = false
                           operators.each do |o_key, o_value|
                             next unless o_value.include? key

                             oprt = o_key.to_s
                             skip = true if oprt == 'skip'
                           end

                           formated_value = value
                           next unless !value.blank? && !skip

                           formated_value = case oprt
                                            when 'in'
                                              "(#{value})"
                                            when 'like'
                                              "*#{value}*"
                                            else
                                              value
                                            end
                           # timestamps are splited to two inputs as period_from and period_to names, now rename back
                           if 'gtge'.include?(oprt) && key.include?('period_from')
                             key = call('reconstruct_timestamp_name', key, 'period_from')
                           end
                           if 'ltle'.include?(oprt) && key.include?('period_to')
                             key = call('reconstruct_timestamp_name', key, 'period_to')
                           end

                           q_params = q_params + (!value.blank? ? ",#{oprt}(#{key},#{formated_value})" : '')
                         end
                         q_params[0] = '?' unless q_params.blank?

                         q_params
                       end
  },

  actions: {

    create_billing_request: {

      title: 'Create a Billing Request',
      subtitle: 'Billing Request Creation on CloudBlue Connect',
      description: 'This action allows creating a new billing request object on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/user-interface/#Billing' target='_blank'>Official documentation</a>",
      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'id',
                          label: 'Asset ID',
                          hint: 'Provide Asset ID for which you want to create Billing request.',
                          optional: true
                        },
                        {
                          name: 'external_uid',
                          label: 'Asset External UID',
                          hint: 'Provide Asset External UID for which you want to create Billing request.',
                          optional: true
                        },
                        {
                          name: 'product_items',
                          label: 'Product Items',
                          hint: 'Provide relevant product items for Billing request',
                          optional: false,
                          type: 'array', of: 'object', properties: [
                            {
                              name: 'id',
                              label: 'Product Item ID',
                              optional: false
                            }
                          ]
                        },
                        {
                          name: 'type',
                          label: 'Billing Request Type',
                          hint: 'Provide type of Billing request that you want to create.',
                          control_type: 'select',
                          pick_list: 'br_type',
                          optional: false
                        },
                        {
                          name: 'period_from',
                          label: 'Period to',
                          type: 'timestamp',
                          hint: 'Provide Period To for Billing request',
                          optional: false
                        },
                        {
                          name: 'period_to',
                          label: 'Period to',
                          type: 'timestamp',
                          hint: 'Provide Period To for Billing request.',
                          optional: false
                        },

                        {
                          name: 'uom',
                          label: 'Billing Period UOM',
                          hint: 'Provide period UOM of Billing request.',
                          control_type: 'select',
                          pick_list: 'br_period_uom',
                          optional: false
                        },
                        {
                          name: 'delta',
                          label: 'Period Delta',
                          type: :integer,
                          hint: 'Provide Period Delta of Billing request.',
                          optional: false
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        if input['external_uid'].blank? && input['id'].blank?
          error('Provide at least one Asset ID or Externa UID')
        end

        unless input['id'].blank?
          asset = {
            'id' => input['id']
          }
        end

        unless input['external_uid'].blank?
          asset = {
            'external_uid' => input['external_uid']
          }
        end

        product_items = []
        input['product_items'].each do |item|
          product_items.push(
            { 'id': item['id'] }
          )
        end

        payload = {
          "asset": asset,
          "type": input['type'],
          "items": product_items,
          "period": {
            "from": input['period_from'].iso8601,
            "to": input['period_to'].iso8601,
            "delta": input['delta'],
            "uom": input['uom']
          }
        }

        post('/public/v1/subscriptions/requests', payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['tar_response']
      end
    },

    accept_tier_account_request: {
      title: 'Accept a Tier Account Request',
      subtitle: 'Tier Account Request Acceptance on CloudBlue Connect',
      description: 'Vendors can use this action to accept a tier account request in the pending state.',
      help: "<a href='https://connect.cloudblue.com/community/modules/customers/user-interface/#Accepting_Requests' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'request_id',
                          label: 'Request ID',
                          hint: 'Provide unique value identifying this Tier Account Request.',
                          optional: false
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        post("/public/v1/tier/account-requests/#{input['request_id']}/accept")
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['tar_response']
      end
    },

    ignore_tier_account_request: {
      title: 'Ignore a Tier Account Request',
      subtitle: 'Ignore a Tier Account Request on Connect platform',
      description: 'Vendors can use this action to ignore a tier account request in the pending state.',
      help: "<a href='https://connect.cloudblue.com/community/modules/customers/user-interface/#Ignoring_Requests' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'request_id',
                          label: 'Request ID',
                          hint: 'Provide unique value identifying this Tier Account Request.',
                          optional: false
                        },
                        {
                          name: 'reason',
                          label: 'Reason',
                          hint: 'Provide the reason for ignoring Tier Account Request.',
                          optional: true
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        payload = {
          'reason' => input['reason']
        }

        uri = "/public/v1/tier/account-requests/#{input['request_id']}/ignore"

        response = post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
          error("#{message}: #{body}")
        end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['tar_response']
      end
    },

    approve_tier_config_request: {
      title: 'Approve a Tier Configuration Request',
      subtitle: 'Tier Configuration Request Approval on CloudBlue Connect',
      description: 'Vendors can use this action to approve a tier configuration requests in the pending state.',
      help: "<a href='https://connect.cloudblue.com/community/modules/tier-config/user-interface/#Approving_Tier_Requests' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definition|
                      [
                        {
                          name: 'request_id',
                          label: 'PR Request ID',
                          hint: 'Provide the ID of the TC request that you want to approve.',
                          optional: false
                        },
                        {
                          name: 'id',
                          label: 'Activation Template ID',
                          hint: 'Provide  Activation Template ID of TC Request you wish to approve.',
                          optional: false
                        },
                        {
                          name: 'effective_date',
                          label: 'Effective date',
                          type: 'timestamp',
                          hint: 'Provide TC request approvement date.',
                          optional: false
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        payload = {
          "template": {
            "id": input[('id')].to_s,
            "effective_date": input[('effective_date')].to_s
          }
        }

        uri = "/public/v1/tier/config-requests/#{input['request_id']}/approve"

        response = post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
          error("#{message}: #{body}")
        end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['tcr_response']
      end
    },

    update_tier_config_request: {
      title: 'Create an Update Tier Config Request',
      subtitle: 'Create an Update Tier Config Request on the Connect platform',
      description: 'Distributors can create an Update Tier Config Requests for existing Tier Configs, it is required to specify a Tier Config ID and parameters that should be updated (order type).',
      help: "<a href='https://connect.cloudblue.com/community/modules/tier-config/user-interface/#Updating_Tier_Configuration' target='_blank'>Official documentation</a>",

      input_fields: lambda do |object_definition|
                      [

                        {

                          name: 'request_id',
                          label: 'Config Request ID',
                          hint: 'Provide the ID of the Config request that you want to change.',
                          optional: false
                        },
                        {
                          name: 'notes',
                          label: 'Notes',
                          hint: 'Provide Notes comment of the Config request that you want to change.',
                          optional: true
                        }
                      ] +
                        object_definition['custom_json_parameters']
                    end,

      execute: lambda do |_connection, input|
        payload = {}
        payload['params'] = []
        payload['notes'] = input['notes'] unless input['notes'].blank?

        payload['params'] = input['json_params']['data']['array']

        put("/public/v1/tier/config-requests/#{input['request_id']}", payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['tcr_response']
      end
    },

    fill_asset_request_parameters: {
      title: 'Populate Asset Request Parameters',
      subtitle: 'Fill in Subscription Request Parameter Values on CloudBlue Connect',
      description: 'Vendors can use this action to provide values for fulfillment parameters for subscription requests in the pending state. Furthermore, by using line items support, it is possible to populate such parameters dynamically.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/user-interface/requests-management/#Request_Details' target='_blank'>Official documentation</a>",

      input_fields: lambda do |object_definition|
                      [

                        {

                          name: 'request_id',
                          label: 'Asset Request ID',
                          hint: 'Provide the ID of the Asset request that you want to change.',
                          optional: false
                        }
                      ] +
                        object_definition['custom_json_parameters']
                    end,

      execute: lambda do |_connection, input|
        payload = {
          "asset": {
            "params": input['json_params']['data']['asset']['params']
          }
        }

        put("/public/v1/requests/#{input['request_id']}", payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    change_listing_request_status: {
      title: 'Change a Listing Request State',
      subtitle: 'Change the Status of your Listing Request on the Connect platform',
      description: 'Use this action to change the status of your listing requests and consequently to complete this request.',
      help: "<a href='https://connect.cloudblue.com/community/modules/listings/user-interface/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'request_id',
                          label: 'Listing Request ID',
                          hint: 'Provide the ID of the Listing Request that you want to change.',
                          optional: false
                        },
                        {
                          name: 'lr_status',
                          label: 'Listing Request Status',
                          control_type: 'select',
                          pick_list: 'lr_status',
                          hint: 'Pick desired Listing Request status.',
                          optional: false
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        post("/public/v1/listing-requests/#{input['request_id']}/#{input['lr_status']}")
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    reject_tier_config_request: {
      title: 'Reject a Tier Configuration Request',
      subtitle: 'Reject a Tier Configuration Request on CloudBlue Connect',
      description: 'Vendors can use this action to reject a tier configuration request.',
      help: "<a href='https://connect.cloudblue.com/community/modules/tier-config/user-interface/#Rejecting_Tier_Requests' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'request_id',
                          label: 'Request ID',
                          hint: 'Provide unique value identifying this Tier Config Request.',
                          optional: false
                        },
                        {
                          name: 'reason',
                          label: 'Reason',
                          hint: 'Provide the reason for rejecting Tier Config Request request.',
                          optional: true
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        payload = {
          'reason' => input['reason']
        }

        uri = "/public/v1/tier/config-requests/#{input['request_id']}/fail"

        response = post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
          error("#{message}: #{body}")
        end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['tcr_response']
      end
    },

    asset_cancel_request: {
      title: 'Create a Cancel Asset Request',
      subtitle: 'Create a Cancel Asset Request on the Connect platform',
      description: 'Distributors can use this action to create a cancel fulfillment request and consequently to cancel a subscription on Connect.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/fulfillment-requests/#Cancel' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [

                        {
                          name: 'id',
                          label: 'Asset ID',
                          hint: 'Provide the ID of the Asset that you want to cancel.',
                          optional: true
                        },
                        {
                          name: 'external_id',
                          label: 'External ID',
                          hint: 'Provide the External ID of the Asset that you want to cancel.',
                          optional: true
                        },
                        {
                          name: 'external_uid',
                          label: 'External UID',
                          hint: 'Provide the External UID of the Asset that you want to cancel.',
                          optional: true
                        }

                      ]
                    end,

      execute: lambda do |_connection, input|
        if input['external_id'].blank? && input['id'].blank?
          error('Provide at least one Asset ID or External ID + Externa UID')
        end

        params = {
          "type": 'cancel',
          "asset": {}
        }

        unless input['external_id'].blank?
          if input['external_uid'].blank?
            error('When inserting External ID External UID is also required')
          end
          params[:asset][:external_id] = (input['external_id']).to_s
          params[:asset][:external_uid] = (input['external_uid']).to_s
        end

        params[:asset][:id] = (input['id']).to_s unless input['id'].blank?

        post('/public/v1/requests', params)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    asset_suspend_resume_request: {
      title: 'Create a Suspend/Resume Asset Request',
      subtitle: 'Create a Suspend/Resume Subscription Request on the Connect platform',
      description: 'Distributors can use this action to create a suspend or resume fulfillment request and subsequently suspend or resume required subscription. Note that the asset identifier can be passed from previous datapills.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/fulfillment-requests/#Suspend target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'external_id',
                          label: 'External ID',
                          hint: 'Provide the External ID of the Asset that you want to suspend/resume.',
                          optional: false
                        },
                        {
                          name: 'external_uid',
                          label: 'External UID',
                          hint: 'Provide the External UID of the Asset that you want to suspend/resume.',
                          optional: true
                        },
                        {
                          name: 'request_type',
                          label: 'Request type',
                          control_type: 'select',
                          pick_list: 'request_type',
                          hint: 'Pick action type that you would like to preform.',
                          optional: false
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        params = {
          "type": input['request_type'],
          "asset": {
            "external_id": (input['external_id']).to_s,
            "external_uid": (input['external_uid']).to_s
          }
        }

        post('/public/v1/requests', params)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    reject_asset_request: {
      title: 'Reject an Asset Request',
      subtitle: 'Reject a Fulfillment Request on CloudBlue Connect',
      description: 'This action allows rejecting a particular subscription request.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/user-interface/requests-management/#Rejecting_Requests' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'request_id',
            label: 'PR Request ID',
            hint: 'Provide the ID of the the PR request that you want to reject.',
            optional: false
          },
          {
            name: 'reason',
            label: 'Reason',
            hint: 'Provide the reason for rejecting PR request.',
            optional: false
          }
        ]
      end,

      execute: lambda do |_connection, input|
        payload = {
          'reason' => input['reason']
        }

        uri = "/public/v1/requests/#{input['request_id']}/fail"

        response = post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    inquire_asset_request: {
      title: 'Set the Inquire status to an Asset Request',
      subtitle: 'Assign the Inquire status to a Fulfillment Request on the Connect platform',
      description: 'Vendors can use this action to moves the request to the inquire state, allowing technical contact to populate parameters marked as error.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/user-interface/requests-management/#Inquire_Parameter_Data' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'request_id',
                          label: 'Request ID',
                          hint: 'Provide unique value identifying this Request.',
                          optional: false
                        },
                        {
                          name: 'template_id',
                          label: 'Template ID',
                          hint: 'Provide the Template ID of the the request that you want to inquire.',
                          optional: true
                        },
                        {
                          name: 'activation_tile',
                          label: 'Activation Title',
                          hint: 'Provide the Activation Title of the the request that you want to inquire.',
                          optional: true
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        payload = {
          'template_id' => input['template_id'],
          'activation_tile' => input['activation_tile']
        }

        uri = "/public/v1/requests/#{input['request_id']}/inquire"

        response = post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['expanded_request']
      end
    },

    create_helpdesk_case_comment: {
      title: 'Create a Helpdesk Comment',
      subtitle: 'Create a Comment within a Helpdesk Case on Connect',
      description: 'Allows creating a comment within your selected Helpdesk Case.',
      help: "<a href='https://connect.cloudblue.com/community/modules/helpdesk/user-interface/#Adding_Comments' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'conversation_id',
                          label: 'Conversation ID',
                          hint: 'Provide unique value identifying this Conversation.',
                          optional: false
                        },
                        {
                          name: 'text',
                          label: 'Text',
                          hint: 'Provide the Text (Comment) of the the Helpdesk Case that you want to add.',
                          optional: false
                        },
                        {
                          name: 'type',
                          label: 'Type',
                          control_type: 'select',
                          pick_list: 'hc_message_type',
                          hint: 'Choose value of type.',
                          optional: true
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        payload = {
          "text": (input['text']).to_s
        }

        payload['type'] = input['type'] unless input['type'].blank?

        uri = "/public/v1/conversations/#{input['conversation_id']}/messages"

        response = post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['conversations_messages_response']
      end
    },

    update_helpdesk_case: {
      title: 'Update a Helpdesk Case',
      subtitle: 'Update a Helpdesk Case on CloudBlue Connect',
      description: 'Allows updating cases within the Helpdesk module on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/helpdesk/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'case_id',
                          label: 'Case ID',
                          hint: 'Provide unique value identifying this Helpdesk Case.',
                          optional: false
                        },
                        {
                          name: 'id',
                          label: 'Product ID',
                          hint: 'Provide unique value identifying product.',
                          optional: true
                        },
                        {
                          name: 'subject',
                          label: 'Subject',
                          hint: 'Provide subject value of Helpdesk Case.',
                          optional: true
                        },
                        {
                          name: 'description',
                          label: 'Description',
                          hint: 'Provide description value of Helpdesk Case.',
                          optional: true
                        },
                        {
                          name: 'priority',
                          label: 'Priority',
                          hint: 'Value of priority can be 0 (Low), 1 (Medium), 2 (High) or 3 (Urgent).',
                          control_type: 'select',
                          pick_list: 'hc_priority',
                          optional: true
                        },
                        {
                          name: 'type',
                          label: 'Type',
                          hint: 'Value of type can be "technical" or "business".',
                          control_type: 'select',
                          pick_list: 'hc_type',
                          optional: true
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        payload = {
          "product": {}
        }

        payload[:product][:id] = input['id'] unless input['id'].blank?

        payload['subject'] = input['subject'] unless input['subject'].blank?

        payload['description'] = input['description'] unless input['description'].blank?

        payload['priority'] = input['priority'] unless input['priority'].blank?

        payload['type'] = input['type'] unless input['type'].blank?

        uri = "/public/v1/helpdesk/cases/#{input['case_id']}"

        response = put(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['helpdesk_case_response']
      end
    },

    change_helpdesk_case_status: {
      title: 'Change a Helpdesk Case State',
      subtitle: 'Change a Helpdesk Case State on CloudBlue Connect',
      description: 'Allows assignging pending, resolved, or inquiring status to a helpdesk case on the CloudBlue Connect. Note that the case identifier can be passed from previous datapills.',
      help: "<a href='https://connect.cloudblue.com/community/modules/helpdesk/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'case_id',
                          label: 'Case ID',
                          hint: 'Provide unique value identifying this Helpdesk Case.',
                          optional: false
                        },
                        {
                          name: 'hc_status',
                          label: 'Helpdesk Case Status',
                          control_type: 'select',
                          pick_list: 'hc_status',
                          hint: 'Pick desired Helpdesk Case status.',
                          optional: false
                        }
                      ]
                    end,

      execute: lambda do |_connection, input|
        post("/public/v1/helpdesk/cases/#{input['case_id']}/#{input['hc_status']}")
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['helpdesk_case_response']
      end
    },

    search_comments_by_case: {
      title: 'Get Messages by Conversation ID',
      subtitle: 'Get all Comments by using the Conversation ID on CloudBlue Connect.',
      description: 'Get a list of all available messages for a given conversation on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'case_id',
            label: 'Case Id',
            hint: ' A unique value identifying this case.',
            optional: false
          },
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Number of results to return per page.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'The initial index from which to return the results.',
            optional: true
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Period From created Comments/Messages.',
            optional: true
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Period To created Comments/Messages.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of Comments/Messages.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of Comments/Messages.',
            optional: true
          },
          {
            name: 'events.created.by.id',
            label: 'Events Created By Id',
            hint: 'Events Created By Id of Comments/Messages.',
            optional: true
          },
          {
            name: 'events.updated.at_period_from',
            type: 'timestamp',
            label: 'Events Updated At Period From',
            hint: 'Events Updated At Period From of Comments/Messages.',
            optional: true
          },
          {
            name: 'events.updated.at_period_to',
            type: 'timestamp',
            label: 'Events Updated At Period To',
            hint: 'Events Updated At Period To of Comments/Messages.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of Comments/Messages.',
            optional: true
          },
          {
            name: 'text',
            label: 'Text',
            hint: 'Text of Comments/Messages.',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            hint: 'Choose value of type.',
            control_type: 'multiselect',
            pick_list: 'hc_message_type',
            delimiter: ',',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        conversations_id = call(:get_conversations_id, _connection, input['case_id'])

        uri = "/public/v1/conversations/#{conversations_id}/messages"
        operators = {
          eq: ['limit', 'offset', 'events.created.by.id', 'id'],
          ge: [
            'created_period_from', 'events.created.at_period_from',
            'events.updated.at_period_from'
          ],
          le: ['created_period_to', 'events.created.at_period_to', 'events.updated.at_period_to'],
          like: ['text'],
          skip: ['case_id']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          hc_comments_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['hc_comments_response']
      end
    },

    search_for_conversations: {
      title: 'Locate Conversations',
      subtitle: 'Search for required Conversations on CloudBlue Connect',
      description: 'This action allows locating specific conversation objects on the Connect platform',
      help: "<a href='https://connect.cloudblue.com/community/modules' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of Conversations.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of Conversations.',
            optional: true
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Created Period From of Conversations.',
            optional: true
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Created Period To of Conversations.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of Conversations.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of Conversations.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of Conversations.',
            optional: true
          },
          {
            name: 'instance_id',
            label: 'Instance Id',
            hint: 'Instance Id of Conversations.',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = '/public/v1/conversations'
        operators = {
          eq: %w[limit offset id instance_id],
          ge: ['created_period_from', 'events.created.at_period_from'],
          le: ['created_period_to', 'events.created.at_period_to']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          conversations_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['conversations_response']
      end
    },

    search_tier_account_request: {
      title: 'Locate Tier Account Requests',
      subtitle: 'Search for Tier Account Requests on CloudBlue Connect',
      description: 'Use this action to locate particular Tier Account Requests on CloudBlue Connect.',
      help: "<a href='https://connect.cloudblue.com/community/modules/customers' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of tier account request.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of tier account request.',
            optional: true
          },
          {
            name: 'account.external_id',
            label: 'Account External_id',
            hint: 'Account External_id of tier account request.',
            optional: true
          },
          {
            name: 'account.external_uid',
            label: 'Account External_uid',
            hint: 'Account External_uid of tier account request.',
            optional: true
          },
          {
            name: 'account.hub.id',
            label: 'Account Hub Id',
            hint: 'Account Hub Id of tier account request.',
            optional: true
          },
          {
            name: 'account.hub.name',
            label: 'Account Hub Name',
            hint: 'Account Hub Name of tier account request.',
            optional: true
          },
          {
            name: 'account.id',
            label: 'Account Id',
            hint: 'Account Id of tier account request.',
            optional: true
          },
          {
            name: 'account.name',
            label: 'Account Name',
            hint: 'Account Name of tier account request.',
            optional: true
          },
          {
            name: 'account.version',
            label: 'Account Version',
            hint: 'Account Version of tier account request.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At_period_from',
            hint: 'Events Created At_period_from of tier account request.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At_period_to',
            hint: 'Events Created At_period_to of tier account request.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of tier account request.',
            optional: true
          },
          {
            name: 'product.id',
            label: 'Product Id',
            hint: 'Product Id of tier account request.',
            optional: true
          },
          {
            name: 'product.name',
            label: 'Product Name',
            hint: 'Product Name of tier account request.',
            optional: true
          },
          {
            name: 'status',
            label: 'Status',
            hint: 'Status of tier account request.',
            control_type: 'multiselect',
            pick_list: 'tar_status',
            delimiter: ',',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = '/public/v1/tier/account-requests'
        operators = {
          eq: [
            'limit', 'offset', 'account.external_id', 'account.hub.id', 'account.id', 'id',
            'product.id'
          ],
          gt: ['events.created.at_period_from'],
          lt: ['events.created.at_period_to'],
          like: ['account.hub.name', 'account.name', 'product.name']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          tar_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['tar_response']
      end
    },

    search_tier_configuration_requests: {
      title: 'Locate Tier Configuration Requests',
      subtitle: 'Search for Tier Configuration Requests on CloudBlue Connect',
      description: 'Use this action to locate particular Tier Configuration Requests on CloudBlue Connect.',
      help: "<a href='https://connect.cloudblue.com/community/modules/tier-config' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of tier configuration request.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of tier configuration request.',
            optional: true
          },
          {
            name: 'search',
            label: 'Search',
            hint: 'Search of tier configuration request.',
            optional: true
          },
          {
            name: 'assignee.id',
            label: 'Assignee Id',
            hint: 'Assignee Id of tier configuration request.',
            optional: true
          },
          {
            name: 'assignee.name',
            label: 'Assignee Name',
            hint: 'Assignee Name of tier configuration request.',
            optional: true
          },
          {
            name: 'assignee__id',
            label: 'Assignee Id',
            hint: 'Assignee Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.account.external_id',
            label: 'Configuration Account External_id',
            hint: 'Configuration Account External_id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.account.external_uid',
            label: 'Configuration Account External_uid',
            hint: 'Configuration Account External_uid of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.account.hub.id',
            label: 'Configuration Account Hub Id',
            hint: 'Configuration Account Hub Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.account.hub.name',
            label: 'Configuration Account Hub Name',
            hint: 'Configuration Account Hub Name of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.account.id',
            label: 'Configuration Account Id',
            hint: 'Configuration Account Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.connection.type',
            label: 'Configuration Connection Type',
            hint: 'Configuration Connection Type of tier configuration request.',
            control_type: 'multiselect',
            pick_list: 'tcr_environment',
            delimiter: ',',
            optional: true
          },
          {
            name: 'configuration.id',
            label: 'Configuration Id',
            hint: 'Configuration Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.marketplace.id',
            label: 'Configuration Marketplace Id',
            hint: 'Configuration Marketplace Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.marketplace.name',
            label: 'Configuration Marketplace Name',
            hint: 'Configuration Marketplace Name of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.product.id',
            label: 'Configuration Product Id',
            hint: 'Configuration Product Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.product.name',
            label: 'Configuration Product Name',
            hint: 'Configuration Product Name of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration.tier_level',
            label: 'Configuration Tier_level',
            hint: 'Configuration Tier_level of tier configuration request.',
            control_type: 'multiselect',
            pick_list: 'tcr_tier_level',
            delimiter: ',',
            optional: true
          },
          {
            name: 'configuration__account__external_uid',
            label: 'Configuration Account External Uid',
            hint: 'Configuration Account External Uid of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration__account__id',
            label: 'Configuration Account Id',
            hint: 'Configuration Account Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration__id',
            label: 'Configuration Id',
            hint: 'Configuration Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration__product__id',
            label: 'Configuration Product Id',
            hint: 'Configuration Product Id of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration__product__name',
            label: 'Configuration Product Name',
            hint: 'Configuration Product Name of tier configuration request.',
            optional: true
          },
          {
            name: 'configuration__tier_level',
            label: 'Configuration Tier Level',
            hint: 'Configuration Tier Level of tier configuration request.',
            control_type: 'multiselect',
            pick_list: 'tcr_tier_level',
            delimiter: ',',
            optional: true
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Created Period From of tier configuration request.',
            optional: true
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Created Period To of tier configuration request.',
            optional: true
          },
          {
            name: 'environment',
            label: 'Environment',
            hint: 'Environment of tier configuration request.',
            control_type: 'multiselect',
            pick_list: 'tcr_environment',
            delimiter: ',',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of tier configuration request.',
            optional: true
          },
          {
            name: 'params.id',
            label: 'Params Id',
            hint: 'Params Id of tier configuration request.',
            optional: true
          },
          {
            name: 'params.value',
            label: 'Params Value',
            hint: 'Params Value of tier configuration request.',
            optional: true
          },
          {
            name: 'status',
            label: 'Status',
            hint: 'Status of tier configuration request.',
            control_type: 'multiselect',
            pick_list: 'fr_status',
            delimiter: ',',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            hint: 'Type of tier configuration request.',
            control_type: 'multiselect',
            pick_list: 'tcr_type',
            delimiter: ',',
            optional: true
          },
          {
            name: 'unassigned',
            label: 'Unassigned',
            hint: 'Unassigned of tier configuration request.',
            optional: true
          },
          {
            name: 'updated_period_from',
            type: 'timestamp',
            label: 'Updated Period From',
            hint: 'Updated Period From of tier configuration request.',
            optional: true
          },
          {
            name: 'updated_period_to',
            type: 'timestamp',
            label: 'Updated Period To',
            hint: 'Updated Period To of tier configuration request.',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = '/public/v1/tier/config-requests'
        operators = {
          eq: [
            'limit', 'offset', 'assignee.id', 'assignee__id', 'configuration.account.external_id',
            'configuration.account.hub.id', 'configuration.account.id', 'configuration.id', 'configuration.marketplace.id', 'configuration.product.id', 'configuration__account__id', 'configuration__id', 'configuration__product__id', 'id', 'params.id', 'unassigned', 'params.value', 'configuration__account__external_uid', 'configuration.account.external_uid', 'search'
          ],
          ge: %w[created_period_from updated_period_from],
          le: %w[created_period_to updated_period_to],
          like: [
            'assignee.name', 'configuration.account.hub.name', 'configuration.marketplace.name',
            'configuration.product.name', 'configuration__product__name'
          ]
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          tcr_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['tcr_response']
      end
    },

    search_tier_configurations: {
      title: 'Locate Tier Accounts',
      subtitle: 'Search for Tier Accounts on the Connect platform',
      description: 'Use this action to find specific Tier Accounts on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/customers' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of tier accounts.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of tier accounts.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At_period_from',
            hint: 'Events Created At_period_from of tier accounts.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At_period_to',
            hint: 'Events Created At_period_to of tier accounts.',
            optional: true
          },
          {
            name: 'external_id',
            label: 'External Id',
            hint: 'External Id of tier accounts.',
            optional: true
          },
          {
            name: 'external_uid',
            label: 'External Uid',
            hint: 'External Uid of tier accounts.',
            optional: true
          },
          {
            name: 'hub.id',
            label: 'Hub Id',
            hint: 'Hub Id of tier accounts.',
            optional: true
          },
          {
            name: 'hub.name',
            label: 'Hub Name',
            hint: 'Hub Name of tier accounts.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of tier accounts.',
            optional: true
          },
          {
            name: 'name',
            label: 'Name',
            hint: 'Name of tier accounts.',
            optional: true
          },
          {
            name: 'owner.id',
            label: 'Owner Id',
            hint: 'Owner Id of tier accounts.',
            optional: true
          },
          {
            name: 'owner.name',
            label: 'Owner Name',
            hint: 'Owner Name of tier accounts.',
            optional: true
          },
          {
            name: 'parent.id',
            label: 'Parent Id',
            hint: 'Parent Id of tier accounts.',
            optional: true
          },
          {
            name: 'parent.name',
            label: 'Parent Name',
            hint: 'Parent Name of tier accounts.',
            optional: true
          },
          {
            name: 'parent.parent.id',
            label: 'Parent Parent Id',
            hint: 'Parent Parent Id of tier accounts.',
            optional: true
          },
          {
            name: 'scopes',
            label: 'Scopes',
            hint: 'Scopes of tier accounts.',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            hint: 'Type of tier accounts.',
            control_type: 'multiselect',
            pick_list: 'tc_account_type',
            delimiter: ',',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = '/public/v1/tier/accounts'
        operators = {
          eq: [
            'limit', 'offset', 'external_id', 'hub.id', 'id', 'owner.id', 'parent.id', 'parent.parent.id', 'scopes', 'external_uid'
          ],
          ge: ['events.created.at_period_from'],
          le: ['events.created.at_period_to'],
          like: ['hub.name', 'name', 'owner.name', 'parent.name']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          ta_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['ta_response']
      end
    },

    search_listing_request: {
      title: 'Locate Listing Request',
      subtitle: 'Search for Listing Requests on CloudBlue Connect',
      description: 'Allows locating specific listing requests on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/listings/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of listing request.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of listing request.',
            optional: true
          },
          {
            name: 'contract__id',
            label: 'Contract Id',
            hint: 'Contract Id of listing request.',
            optional: true
          },
          {
            name: 'contract__name',
            label: 'Contract Name',
            hint: 'Contract Name of listing request.',
            optional: true
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Created Period From of listing request.',
            optional: true
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Created Period To of listing request.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of listing request.',
            optional: true
          },
          {
            name: 'listing.contract.id',
            label: 'Listing Contract Id',
            hint: 'Listing Contract Id of listing request.',
            optional: true
          },
          {
            name: 'listing.contract.marketplace.id',
            label: 'Listing Contract Marketplace Id',
            hint: 'Listing Contract Marketplace Id of listing request.',
            optional: true
          },
          {
            name: 'listing.contract.marketplace.name',
            label: 'Listing Contract Marketplace Name',
            hint: 'Listing Contract Marketplace Name of listing request.',
            optional: true
          },
          {
            name: 'listing.contract.name',
            label: 'Listing Contract Name',
            hint: 'Listing Contract Name of listing request.',
            optional: true
          },
          {
            name: 'listing.id',
            label: 'Listing Id',
            hint: 'Listing Id of listing request.',
            optional: true
          },
          {
            name: 'listing.marketplace.id',
            label: 'Listing Marketplace Id',
            hint: 'Listing Marketplace Id of listing request.',
            optional: true
          },
          {
            name: 'listing.marketplace.name',
            label: 'Listing Marketplace Name',
            hint: 'Listing Marketplace Name of listing request.',
            optional: true
          },
          {
            name: 'listing.product.id',
            label: 'Listing Product Id',
            hint: 'Listing Product Id of listing request.',
            optional: true
          },
          {
            name: 'listing.product.name',
            label: 'Listing Product Name',
            hint: 'Listing Product Name of listing request.',
            optional: true
          },
          {
            name: 'listing.product.version',
            label: 'Listing Product Version',
            hint: 'Listing Product Version of listing request.',
            optional: true
          },
          {
            name: 'listing.provider.id',
            label: 'Listing Provider Id',
            hint: 'Listing Provider Id of listing request.',
            optional: true
          },
          {
            name: 'listing.provider.name',
            label: 'Listing Provider Name',
            hint: 'Listing Provider Name of listing request.',
            optional: true
          },
          {
            name: 'listing.vendor.id',
            label: 'Listing Vendor Id',
            hint: 'Listing Vendor Id of listing request.',
            optional: true
          },
          {
            name: 'listing.vendor.name',
            label: 'Listing Vendor Name',
            hint: 'Listing Vendor Name of listing request.',
            optional: true
          },
          {
            name: 'listing__id',
            label: 'Listing Id',
            hint: 'Listing Id of listing request.',
            optional: true
          },
          {
            name: 'marketplace__id',
            label: 'Marketplace Id',
            hint: 'Marketplace Id of listing request.',
            optional: true
          },
          {
            name: 'marketplace__name',
            label: 'Marketplace Name',
            hint: 'Marketplace Name of listing request.',
            optional: true
          },
          {
            name: 'product.id',
            label: 'Product Id',
            hint: 'Product Id of listing request.',
            optional: true
          },
          {
            name: 'product.name',
            label: 'Product Name',
            hint: 'Product Name of listing request.',
            optional: true
          },
          {
            name: 'product.version',
            label: 'Product Version',
            hint: 'Product Version of listing request.',
            optional: true
          },
          {
            name: 'product__id',
            label: 'Product Id',
            hint: 'Product Id of listing request.',
            optional: true
          },
          {
            name: 'product__name',
            label: 'Product Name',
            hint: 'Product Name of listing request.',
            optional: true
          },
          {
            name: 'product__version',
            label: 'Product Version',
            hint: 'Product Version of listing request.',
            optional: true
          },
          {
            name: 'provider__id',
            label: 'Provider Id',
            hint: 'Provider Id of listing request.',
            optional: true
          },
          {
            name: 'provider__name',
            label: 'Provider Name',
            hint: 'Provider Name of listing request.',
            optional: true
          },
          {
            name: 'state',
            label: 'State',
            hint: 'State of listing request.',
            control_type: 'multiselect',
            pick_list: 'listing_requests_state',
            delimiter: ',',
            optional: true
          },
          {
            name: 'status',
            label: 'Status',
            hint: 'Status of listing request.',
            control_type: 'multiselect',
            pick_list: 'listing_requests_status',
            delimiter: ',',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            hint: 'Type of listing request.',
            control_type: 'multiselect',
            pick_list: 'listing_requests_type',
            delimiter: ',',
            optional: true
          },
          {
            name: 'updated_period_from',
            type: 'timestamp',
            label: 'Updated Period From',
            hint: 'Updated Period From of listing request.',
            optional: true
          },
          {
            name: 'updated_period_to',
            type: 'timestamp',
            label: 'Updated Period To',
            hint: 'Updated Period To of listing request.',
            optional: true
          },
          {
            name: 'vendor__id',
            label: 'Vendor Id',
            hint: 'Vendor Id of listing request.',
            optional: true
          },
          {
            name: 'vendor__name',
            label: 'Vendor Name',
            hint: 'Vendor Name of listing request.',
            optional: true
          }
        ]
      end,

      execute: lambda do |_connection, input|
        uri = '/public/v1/listing-requests'
        operators = {
          eq: [
            'limit', 'offset', 'contract__id', 'id', 'listing.contract.id', 'listing.contract.marketplace.id',
            'listing.id', 'listing.marketplace.id', 'listing.product.id', 'listing.provider.id', 'listing.vendor.id', 'listing__id', 'marketplace__id', 'product.id', 'product__id', 'provider__id', 'vendor__id'
          ],
          ge: %w[created_period_from updated_period_from],
          le: %w[created_period_to updated_period_to],
          like: [
            'contract__name', 'listing.contract.marketplace.name', 'listing.contract.name',
            'listing.marketplace.name', 'listing.product.name', 'listing.provider.name', 'listing.vendor.name', 'marketplace__name', 'product.name', 'product__name', 'provider__name', 'vendor__name'
          ]
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          listing_requests: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['listing_requests']
      end
    },
    search_recurring_asset: {
      title: 'Locate Asset Requests',
      subtitle: 'Search for Fulfillment Requests on the Connect platform',
      description: 'Use this action to locate specific Fulfillment Requests on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/fulfillment-requests/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |object_definitions|
                      object_definitions['requests_inputs']
                    end,

      execute: lambda do |_connection, input|
                 uri = '/public/v1/requests'
                 operators = {
                   eq: [
                     'limit', 'offset', 'asset.account_id', 'asset.connection.hub.id', 'asset.connection.id', 'asset.connection.provider.id',
                     'asset.connection.vendor.id', 'asset.contract.id', 'asset.external.id', 'asset.external_id',
                     'asset.id', 'asset.marketplace.id', 'asset.params.id', 'asset.product.id', 'asset.tier1_id',
                     'asset.tier2_id', 'asset.tiers.tier1.id', 'asset.tiers.tier2.id',
                     'asset__connection__hub__id', 'asset__connection__provider__id', 'asset__connection__vendor__id',
                     'asset__id', 'asset__product__id', 'asset__tiers__tier1__id', 'asset__tiers__tier2__id',
                     'asset_id', 'contract.id', 'contract__id', 'id', 'marketplace.id', 'product_id'
                   ],
                   gt: %w[created_period_from updated_period_from],
                   lt: %w[created_period_to updated_period_to],
                   like: [
                     'asset.connection.hub.name', 'asset.connection.provider.name', 'asset.connection.vendor.name',
                     'asset.marketplace.name', 'asset.product.name', 'asset.tiers.customer.name', 'asset__connection__hub__name',
                     'asset__connection__provider__name', 'asset__connection__vendor__name', 'asset__product__name', 'marketplace.name',
                     'marketplace__name', 'asset.tiers.customer.id', 'asset__tiers__customer__id'
                   ]
                 }

                 q_params = ''
                 q_params = call(:form_query_params, input, q_params, operators)

                 uri = uri + q_params

                 all_items = get(uri)
                 response = []
                 one_time_elements = []
                 recurring_elements = []
                 all_items.each do |item|
                   if item['asset']['items'][0]['period'] == 'OneTime'
                     one_time_elements.push(item)
                   else
                     recurring_elements.push(item)
                   end
                 end

                 response = input['asset_type'] == 'recurring' ? recurring_elements : one_time_elements
                 {
                   search_recurring_assets_response: response
                 }
               end,

      output_fields: lambda do |object_definitions|
                       object_definitions['search_recurring_assets_response']
                     end
    },

    search_product_items: {
      title: 'Locate Product Items',
      subtitle: 'Search for Product Items on CloudBlue Connect',
      description: 'Allows locating specific product items on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/products/items/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'product_id',
            label: 'Product Id',
            hint: 'Product Id of product item.',
            optional: false
          },
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of product item.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of product item.',
            optional: true
          },
          {
            name: 'app.id',
            label: 'App Id',
            hint: 'App Id of product item.',
            optional: true
          },
          {
            name: 'commitment.count',
            label: 'Commitment Count',
            hint: 'Commitment Count of product item.',
            optional: true
          },
          {
            name: 'description.value',
            label: 'Description Value',
            hint: 'Description Value of product item.',
            optional: true
          },
          {
            name: 'display_name',
            label: 'Display Name',
            hint: 'Display Name of product item.',
            optional: true
          },
          {
            name: 'dynamic',
            label: 'Dynamic',
            hint: 'Dynamic of product item.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of product item.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of product item.',
            optional: true
          },
          {
            name: 'events.saleended.at_period_from',
            type: 'timestamp',
            label: 'Events Saleended At Period From',
            hint: 'Events Saleended At Period From of product item.',
            optional: true
          },
          {
            name: 'events.saleended.at_period_to',
            type: 'timestamp',
            label: 'Events Saleended At Period To',
            hint: 'Events Saleended At Period To of product item.',
            optional: true
          },
          {
            name: 'events.updated.at_period_from',
            type: 'timestamp',
            label: 'Events Updated At Period From',
            hint: 'Events Updated At Period From of product item.',
            optional: true
          },
          {
            name: 'events.updated.at_period_to',
            type: 'timestamp',
            label: 'Events Updated At Period To',
            hint: 'Events Updated At Period To of product item.',
            optional: true
          },
          {
            name: 'frozen',
            label: 'Frozen',
            hint: 'Frozen of product item.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of product item.',
            optional: true
          },
          {
            name: 'item_type',
            label: 'Item Type',
            hint: 'Item Type of product item.',
            control_type: 'multiselect',
            pick_list: 'product_item_type',
            delimiter: ',',
            optional: true
          },
          {
            name: 'local_id',
            label: 'Local Id',
            hint: 'Local Id of product item.',
            optional: true
          },
          {
            name: 'mpn',
            label: 'Mpn',
            hint: 'Mpn of product item.',
            optional: true
          },
          {
            name: 'name',
            label: 'Name',
            hint: 'Name of product item.',
            optional: true
          },
          {
            name: 'period',
            label: 'Period',
            hint: 'Period of product item.',
            control_type: 'multiselect',
            pick_list: 'product_item_period',
            delimiter: ',',
            optional: true
          },
          {
            name: 'replacement.id',
            label: 'Replacement Id',
            hint: 'Replacement Id of product item.',
            optional: true
          },
          {
            name: 'status',
            label: 'Status',
            hint: 'Status of product item.',
            control_type: 'multiselect',
            pick_list: 'product_item_status',
            delimiter: ',',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            hint: 'Type of product item.',
            control_type: 'multiselect',
            pick_list: 'product_item_type',
            delimiter: ',',
            optional: true
          },
          {
            name: 'unit.title',
            label: 'Unit Title',
            hint: 'Unit Title of product item.',
            optional: true
          },
          {
            name: 'usage_data_type',
            label: 'Usage Data Type',
            hint: 'Usage Data Type of product item.',
            control_type: 'multiselect',
            pick_list: 'product_item_usage_data_type',
            delimiter: ',',
            optional: true
          },
          {
            name: 'verbose_id',
            label: 'Verbose Id',
            hint: 'Verbose Id of product item.',
            optional: true
          },
          {
            name: 'version',
            label: 'Version',
            hint: 'Version of product item.',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = "/public/v1/products/#{input['product_id']}/items"
        operators = {
          eq: [
            'product_id', 'limit', 'offset', 'app.id', 'id', 'local_id', 'replacement.id',
            'verbose_id'
          ],
          ge: [
            'events.created.at_period_from', 'events.saleended.at_period_from',
            'events.updated.at_period_from'
          ],
          le: [
            'events.created.at_period_to', 'events.saleended.at_period_to',
            'events.updated.at_period_to'
          ],
          like: %w[display_name name],
          skip: ['product_id']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          products_items_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['products_items_response']
      end
    },

    search_product_params: {
      title: 'Locate Product Parameters',
      subtitle: 'Search for Product Parameters on CloudBlue Connect',
      description: 'Use this action to locate specific Parameters for a particular Product on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/products/parameters/' target='_blank'>Official documentation</a>",
      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'product_id',
            label: 'Product Id',
            hint: 'Product Id of product parameter.',
            optional: false
          },
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of product parameter.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of product parameter.',
            optional: true
          },
          {
            name: 'constraints.hidden',
            label: 'Constraints Hidden',
            hint: 'Constraints Hidden of product parameter.',
            optional: true
          },
          {
            name: 'constraints.reconciliation',
            label: 'Constraints Reconciliation',
            hint: 'Constraints Reconciliation of product parameter.',
            optional: true
          },
          {
            name: 'constraints.required',
            label: 'Constraints Required',
            hint: 'Constraints Required of product parameter.',
            optional: true
          },
          {
            name: 'constraints.shared',
            label: 'Constraints Shared',
            hint: 'Constraints Shared of product parameter.',
            optional: true
          },
          {
            name: 'constraints.unique',
            label: 'Constraints Unique',
            hint: 'Constraints Unique of product parameter.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of product parameter.',
            optional: true
          },
          {
            name: 'name',
            label: 'Name',
            hint: 'Name of product parameter.',
            optional: true
          },
          {
            name: 'phase',
            label: 'Phase',
            hint: 'Phase of product parameter.',
            control_type: 'multiselect',
            pick_list: 'product_parametar_phase',
            delimiter: ',',
            optional: true
          },
          {
            name: 'position',
            label: 'Position',
            hint: 'Position of product parameter.',
            optional: true
          },
          {
            name: 'scope',
            label: 'Scope',
            hint: 'Scope of product parameter.',
            control_type: 'multiselect',
            pick_list: 'product_parametar_scope',
            delimiter: ',',
            optional: true
          },
          {
            name: 'title',
            label: 'Title',
            hint: 'Title of product parameter.',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            hint: 'Type of product parameter.',
            control_type: 'multiselect',
            pick_list: 'product_parametar_type',
            delimiter: ',',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = "/public/v1/products/#{input['product_id']}/parameters"
        operators = {
          eq: %w[product_id limit offset id],
          ge: [],
          le: [],
          like: ['name'],
          skip: ['product_id']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          products_params_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['products_params_response']
      end
    },

    search_billing_asset: {
      title: 'Locate Billing Requests',
      subtitle: 'Search for Billing Requests on the Connect platform',
      description: 'Use this action to locate specific Billing Requests on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/user-interface/#Billing' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of billing request.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of billing request.',
            optional: true
          },
          {
            name: 'asset.billing.next_date_period_from',
            type: 'timestamp',
            label: 'Asset Billing Next_date Period From',
            hint: 'Asset Billing Next_date Period From of billing request.',
            optional: true
          },
          {
            name: 'asset.billing.next_date_period_to',
            type: 'timestamp',
            label: 'Asset Billing Next_date Period To',
            hint: 'Asset Billing Next_date Period To of billing request.',
            optional: true
          },
          {
            name: 'asset.billing.period.uom',
            label: 'Asset Billing Period Uom',
            hint: 'Asset Billing Period Uom of billing request.',
            control_type: 'multiselect',
            pick_list: 'asset_billing_period',
            delimiter: ',',
            optional: true
          },
          {
            name: 'asset.connection.hub.id',
            label: 'Asset Connection Hub Id',
            hint: 'Asset Connection Hub Id of billing request.',
            optional: true
          },
          {
            name: 'asset.connection.hub.name',
            label: 'Asset Connection Hub Name',
            hint: 'Asset Connection Hub Name of billing request.',
            optional: true
          },
          {
            name: 'asset.connection.id',
            label: 'Asset Connection Id',
            hint: 'Asset Connection Id of billing request.',
            optional: true
          },
          {
            name: 'asset.connection.provider.id',
            label: 'Asset Connection Provider Id',
            hint: 'Asset Connection Provider Id of billing request.',
            optional: true
          },
          {
            name: 'asset.connection.provider.name',
            label: 'Asset Connection Provider Name',
            hint: 'Asset Connection Provider Name of billing request.',
            optional: true
          },
          {
            name: 'asset.connection.type',
            label: 'Asset Connection Type',
            hint: 'Asset Connection Type of billing request.',
            control_type: 'multiselect',
            pick_list: 'tcr_environment',
            delimiter: ',',
            optional: true
          },
          {
            name: 'asset.connection.vendor.id',
            label: 'Asset Connection Vendor Id',
            hint: 'Asset Connection Vendor Id of billing request.',
            optional: true
          },
          {
            name: 'asset.connection.vendor.name',
            label: 'Asset Connection Vendor Name',
            hint: 'Asset Connection Vendor Name of billing request.',
            optional: true
          },
          {
            name: 'asset.contract.id',
            label: 'Asset Contract Id',
            hint: 'Asset Contract Id of billing request.',
            optional: true
          },
          {
            name: 'asset.external_id',
            label: 'Asset External_id',
            hint: 'Asset External_id of billing request.',
            optional: true
          },
          {
            name: 'asset.external_uid',
            label: 'Asset External_uid',
            hint: 'Asset External_uid of billing request.',
            optional: true
          },
          {
            name: 'asset.id',
            label: 'Asset Id',
            hint: 'Asset Id of billing request.',
            optional: true
          },
          {
            name: 'asset.marketplace.id',
            label: 'Asset Marketplace Id',
            hint: 'Asset Marketplace Id of billing request.',
            optional: true
          },
          {
            name: 'asset.marketplace.name',
            label: 'Asset Marketplace Name',
            hint: 'Asset Marketplace Name of billing request.',
            optional: true
          },
          {
            name: 'asset.product.id',
            label: 'Asset Product Id',
            hint: 'Asset Product Id of billing request.',
            optional: true
          },
          {
            name: 'asset.product.name',
            label: 'Asset Product Name',
            hint: 'Asset Product Name of billing request.',
            optional: true
          },
          {
            name: 'asset.tiers.customer.id',
            label: 'Asset Tiers Customer Id',
            hint: 'Asset Tiers Customer Id of billing request.',
            optional: true
          },
          {
            name: 'asset.tiers.tier1.id',
            label: 'Asset Tiers Tier1 Id',
            hint: 'Asset Tiers Tier1 Id of billing request.',
            optional: true
          },
          {
            name: 'asset.tiers.tier2.id',
            label: 'Asset Tiers Tier2 Id',
            hint: 'Asset Tiers Tier2 Id of billing request.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of billing request.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of billing request.',
            optional: true
          },
          {
            name: 'events.updated.at_period_from',
            type: 'timestamp',
            label: 'Events Updated At Period From',
            hint: 'Events Updated At Period From of billing request.',
            optional: true
          },
          {
            name: 'events.updated.at_period_to',
            type: 'timestamp',
            label: 'Events Updated At Period To',
            hint: 'Events Updated At Period To of billing request.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of billing request.',
            optional: true
          },
          {
            name: 'period.from_period_from',
            type: 'timestamp',
            label: 'Period From Period From',
            hint: 'Period From Period From of billing request.',
            optional: true
          },
          {
            name: 'period.from_period_to',
            type: 'timestamp',
            label: 'Period From Period To',
            hint: 'Period From Period To of billing request.',
            optional: true
          },
          {
            name: 'period.to_period_from',
            type: 'timestamp',
            label: 'Period To Period From',
            hint: 'Period To Period From of billing request.',
            optional: true
          },
          {
            name: 'period.to_period_to',
            type: 'timestamp',
            label: 'Period To Period To',
            hint: 'Period To Period To of billing request.',
            optional: true
          },
          {
            name: 'period.uom',
            label: 'Period Uom',
            hint: 'Period Uom of billing request.',
            control_type: 'multiselect',
            pick_list: 'asset_billing_period',
            delimiter: ',',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            hint: 'Type of billing request.',
            control_type: 'multiselect',
            pick_list: 'br_type',
            delimiter: ',',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = '/public/v1/subscriptions/requests'
        operators = {
          eq: [
            'limit', 'offset', 'asset.connection.hub.id', 'asset.connection.id',
            'asset.connection.provider.id', 'asset.connection.vendor.id', 'asset.contract.id', 'asset.external_id', 'asset.id', 'asset.marketplace.id', 'asset.product.id', 'asset.tiers.customer.id', 'asset.tiers.tier1.id', 'asset.tiers.tier2.id', 'id'
          ],
          gt: [
            'asset.billing.next_date_period_from', 'events.created.at_period_from',
            'events.updated.at_period_from', 'period.from_period_from', 'period.to_period_from'
          ],
          lt: [
            'asset.billing.next_date_period_to', 'events.created.at_period_to',
            'events.updated.at_period_to', 'period.from_period_to', 'period.to_period_to'
          ],
          like: [
            'asset.connection.hub.name', 'asset.connection.provider.name',
            'asset.connection.vendor.name', 'asset.marketplace.name', 'asset.product.name'
          ]
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          billing_assets: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['br_response']
      end
    },

    asset_approve_request: {
      title: 'Approve an Asset Request',
      subtitle: 'Approve a Fulfillment Request on CloudBlue Connect',
      description: 'Vendors can use this action to approve a particular fulfillment request in the pending state.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/user-interface/requests-management/#Approving_Requests' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'request_id',
            label: 'PR Request ID',
            hint: 'Provide the ID of the the PR request that you want to approve. Only pending and inquiring requests can be approved.',
            optional: false
          },
          {
            name: 'template_id',
            label: 'Activation Template ID',
            hint: 'Provide  Activation Template ID of Subscription Request you wish to approve.',
            optional: false
          },
          {
            name: 'effective_date',
            label: 'Effective date',
            type: 'timestamp',
            hint: 'Provide subscription requirement approvement date.',
            optional: false
          }
        ]
      end,

      execute: lambda do |_connection, input|
        payload = {
          'effective_Date' => input['effective_date'],
          'template_id' => input['template_id']
        }

        uri = "/public/v1/requests/#{input['request_id']}/approve"

        response = post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    asset_purchase_request_dynamic_tier: {
      title: 'Create a Purchase Request',
      subtitle: 'Create a Purchase Subscription Request on CloudBlue Connect',
      description: 'Distributors can use this action to create a purchase subscription request. This action has line items support to add multiple items or set multiple parameters (order type).',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/fulfillment-requests/#Purchase' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'asset_external_id',
                          label: 'Asset External ID',
                          hint: 'Provide the ID of the asset from the external system, for example pointing to a contract identifier or unique one that will map this asset with.',
                          optional: false
                        },
                        {
                          name: 'asset_external_uid',
                          label: 'Asset External UID',
                          hint: "Provide if you have it a unique identifier in the form of a UUID for the requested asset on the commerce system, in case it's not provided a unique UUID will be auto-generated.",
                          optional: true
                        },
                        {
                          name: 'hub_id',
                          label: 'Hub ID',
                          hint: 'Provide the ID of your hub obtained from Provider Portal Hubs module. ID of the hub must have the form of HB-XXXX-XXXX.',
                          optional: false
                        },
                        {
                          name: 'marketplace_name',
                          label: 'Marketplace name',
                          hint: 'Provide the name of desired marketplace',
                          optional: false
                        },
                        {
                          name: 'connection_type',
                          label: 'Environment',
                          pick_list: 'connection_type',
                          control_type: 'select',
                          hint: 'Provide the name of desired marketplace',
                          optional: true
                        },
                        {
                          name: 'params',
                          label: 'Parameters',
                          hint: 'Please fill in order phase parameters if any.',
                          optional: true,
                          type: 'array', of: 'object', properties: [

                            {
                              name: 'id',
                              label: 'Parameter ID',
                              hint: 'Provide the ID of the parameter.',
                              optional: false
                            },
                            {
                              name: 'value',
                              label: 'Value',
                              hint: 'Provide value of parameter.',
                              optional: true
                            },
                            {
                              name: 'type',
                              label: 'Type',
                              control_type: 'select',
                              pick_list: 'param_type',
                              hint: 'Provide type of parameter.',
                              optional: false
                            }
                          ]
                        },

                        {
                          name: 'tiers',
                          label: 'Tiers',
                          hint: '',
                          optional: false,
                          type: 'array', of: 'object', properties: [

                            {
                              name: 'external_id',
                              label: 'External ID',
                              hint: "Provide the ID of the Tier 1 on the external system that will help you identify the account on Connect platform. Please note that vendor also will see it for helping on support operations.\n",
                              optional: false
                            },
                            {
                              name: 'external_uid',
                              label: 'External UID',
                              hint: "Provide if you have it a unique identifier in the form of a UUID for the tier on the commerce system, in case it's not provided a unique UUID will be auto-generated.",
                              optional: true
                            },
                            {
                              name: 'account_name',
                              label: 'Account Name',
                              hint: 'Specify the company or account name on the commerce system to be used for request creation.',
                              optional: false
                            },
                            {
                              name: 'address_line1',
                              label: 'Address Line 1',
                              hint: 'Provide the postal address of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.',
                              optional: false
                            },
                            {
                              name: 'address_line2',
                              label: 'Address Line 2',
                              hint: '',
                              optional: true
                            },
                            {
                              name: 'postal_code',
                              label: 'Postal Code',
                              hint: 'Provide the postal code of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.',
                              optional: false
                            },
                            {
                              name: 'city',
                              label: 'City',
                              hint: 'Please specify the City name of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.',
                              optional: false
                            },
                            {
                              name: 'state',
                              label: 'State Or Province',
                              hint: '',
                              optional: false
                            },

                            {
                              name: 'country',
                              label: 'Country',
                              hint: 'Provide the country of the related account, please use Alpha-2 code.',
                              optional: false
                            },
                            {
                              name: 'first_name',
                              label: 'Contact First Name',
                              hint: 'Provide the contact name of the technical contact related with the account.',
                              optional: false
                            },
                            {
                              name: 'last_name',
                              label: 'Contact Last Name',
                              hint: 'Provide the last name or family name of the technical contact related with the account.',
                              optional: false
                            },
                            {
                              name: 'email',
                              label: 'Email',
                              hint: "Provide the email address of the technical contact related with the account, this one typically is a requirement by vendors to process the request, additionally please note that this email will be used to send inquire requests related with the fulfillment of the request.\n",
                              optional: false
                            },
                            {
                              name: 'phone_number',
                              label: 'Phone Number',
                              hint: "Provide the phone number of the technical contact. We suggest to use international phone notation in order to ensure the correctness of the phone number.\n",
                              optional: true
                            },
                            {
                              name: 'country_code',
                              label: 'Country Code',
                              hint: 'Provide country code for the phone number of the technical contact.',
                              optional: true
                            },
                            {
                              name: 'area_code',
                              label: 'Areac Code',
                              hint: 'Provide area code for the phone number of the technical contact.',
                              optional: true
                            },
                            {
                              name: 'extension',
                              label: 'Extension',
                              hint: 'Provide extension for the phone number of the technical contact.',
                              optional: true
                            }

                          ]
                        },

                        {
                          name: 'product_id',
                          label: 'Product ID',
                          hint: "Provide the Product's ID.",
                          optional: false
                        },
                        {
                          name: 'product_items',
                          label: 'Product Items',
                          hint: '',
                          optional: false,
                          type: 'array', of: 'object', properties: [
                            { optional: false, name: 'id', label: 'Item ID' },
                            { optional: false, name: 'quantity', label: 'Quantity' }
                          ]
                        }

                      ]
                    end,

      execute: lambda do |connection, input|
        asset_external_uid = if input['asset_external_uid'].blank?
                               workato.uuid
                             else
                               input['asset_external_uid']
                             end

        marketplace_id = call(:get_maketplace_id, connection, input['marketplace_name'])
        formated_tiers = []

        input['tiers'].each_with_index do |tier, index|
          external_uid = if tier['external_uid'].blank?
                           call(:get_tier_external_uid, connection, tier['external_id'])
                         else
                           tier['external_uid']
                         end

          tier_type = if index == 0
                        'customer'
                      else
                        "tier#{index}"
                      end

          formated_tier = {
            'name' => tier['account_name'],
            'type' => tier_type,
            'external_id' => tier['external_id'],
            'external_uid' => external_uid,

            'contact_info' => {
              'address_line1' => tier['address_line1'],
              'address_line2' => tier['address_line2'],
              'city' => tier['city'],
              'state' => tier['state'],
              'postal_code' => tier['postal_code'],
              'country' => tier['country'],
              'contact' => {
                'first_name' => tier['first_name'],
                'last_name' => tier['last_name'],
                'email' => tier['email'],
                'phone_number' => {
                  'country_code' => tier['country_code'].blank? ? '' : tier['country_code'],
                  'area_code' => tier['area_code'].blank? ? '' : tier['area_code'],
                  'phone_number' => tier['phone_number'].blank? ? '' : tier['phone_number'],
                  'extension' => tier['extension'].blank? ? '' : tier['extension']
                }
              }
            }
          }
          formated_tiers.push(formated_tier)
        end
        external_uids = {
          'asset_external_uid' => asset_external_uid
        }

        tiers = {
          'customer' => formated_tiers[0]
        }

        params = []
        input['params']&.each_with_index do |param, _index|
          if param['type'].blank? || param['id'].blank?
            error('Each parameter must have ID and Type defined.')
          end

          next if param['value'].empty?

          value = param['value']

          case param['type']
          when 'int'
            value = param['value'].to_i
          when 'str'
            value = param['value'].to_s
          when 'float'
            value = param['value'].to_f
          when 'bool'
            value = param['value'].is_true?
          end

          formated_param = {
            'id' => param['id'],
            'value' => value
          }

          params.push(formated_param)
        end

        formated_tiers.each_with_index do |tier, index|
          external_uids[tier['type']] = tier['external_uid']
          tiers[tier['type']] = tier if index > 0
        end

        payload = {
          'type' => 'purchase',
          'asset' => {
            'product' => {
              'id' => input['product_id']

            },
            "connection": {
              "type": input['connection_type']
            },
            'external_uid' => asset_external_uid.to_s,
            'external_id' => (input['asset_external_id']).to_s,
            'items' => input['product_items'],
            'params' => params,
            'tiers' => tiers
          },
          'marketplace' => {
            'id' => marketplace_id.to_s
          }
        }

        response = post('/public/v1/requests', payload)
          .after_error_response(/.*/) do |_, body, _, message|
          error("#{message}: #{body}")
        end

        response['external_uids'] = external_uids

        response
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    asset_change_request: {
      title: 'Create Asset Change Request',
      subtitle: 'Create Asset Change Request in CloudBlue Connect',
      description: 'Distributors can use this action to create a new change subscription request. The asset identifier can be passed from previous datapills.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/fulfillment-requests/#Change' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'items',
            label: 'Changed items list',
            type: 'array',
            optional: false,
            properties: [
              { name: 'global_id' },
              { name: 'quantity' }
            ]
          },
          {
            name: 'id',
            label: 'Asset ID',
            hint: 'Provide the ID of the Asset that you want to change.',
            optional: true
          },
          {
            name: 'external_id',
            label: 'External ID',
            hint: 'Provide the External ID of the Asset that you want to change.',
            optional: true
          },
          {
            name: 'external_uid',
            label: 'External UID',
            hint: 'Provide the External UID of the Asset that you want to change.',
            optional: true
          }
        ]
      end,

      execute: lambda do |_connection, input|
        if input['external_id'].blank? && input['id'].blank?
          error('Provide at least one Asset ID or External ID + Externa UID')
        end

        payload = {
          'type' => 'change',
          'asset' => {
            'items' => input['items']
          }
        }

        unless input['external_id'].blank?
          if input['external_uid'].blank?
            error('When inserting External ID External UID is also required')
          end
          payload['asset'][:external_id] = (input['external_id']).to_s
          payload['asset'][:external_uid] = (input['external_uid']).to_s
        end

        payload[:asset][:id] = (input['id']).to_s unless input['id'].blank?

        response = post('/public/v1/requests', payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    get_usage_records: {
      title: 'Get Usage Records',
      subtitle: 'Locate required Usage Records on the Connect platform',
      description: 'Use this action to locate required usage record objects on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/usage_module' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'file_id',
            label: 'File ID',
            optional: false,
            hint: 'Set ID of file to get'
          }
        ]
      end,

      execute: lambda do |_connection, input|
        {
          records: get("/public/v1/usage/records?eq(usage_file,#{input['file_id']})")
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['usage_records']
      end
    },

    tier_account_request: {
      title: 'Create a Tier Account Request',
      subtitle: 'Create a Tier Account Request on CloudBlue Connect',
      description: 'Distributors can create a new Tier Account Request and consequently provide Vendors with required data changes.',
      help: "<a href='https://connect.cloudblue.com/community/modules/customers/user-interface/#Editing_Tier_Accounts' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'id',
            label: 'Account ID',
            optional: false,
            hint: 'Set ID'
          },
          {
            name: 'name',
            label: 'Account Name',
            optional: false,
            hint: ''
          }
        ]
      end,

      execute: lambda do |_connection, input|
        payload = {
          "type": 'update',
          "account": {
            "id": (input['id']).to_s,
            "name": (input['name']).to_s
          }
        }
        {
          account_requests: post('/public/v1/tier/account-requests', payload)
        }
      end,

      output_fields: lambda do |object_definitions|
                       object_definitions ['tier_account_request']
                     end

    },

    search_products: {
      title: 'Locate Products',
      subtitle: 'Search for required Products on CloudBlue Connect',
      description: 'Use this action to locate specific products on the Connect platform',
      help: "<a href='https://connect.cloudblue.com/community/modules/products/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [

          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of products.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of products.',
            optional: true
          },
          {
            name: 'category.id',
            label: 'Category Id',
            hint: 'Category Id of products.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of products.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of products.',
            optional: true
          },
          {
            name: 'groups.id',
            label: 'Groups Id',
            hint: 'Groups Id of products.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of products.',
            optional: true
          },
          {
            name: 'name',
            label: 'Name',
            hint: 'Name of products.',
            optional: true
          },
          {
            name: 'owner.id',
            label: 'Owner Id',
            hint: 'Owner Id of products.',
            optional: true
          },
          {
            name: 'owner.name',
            label: 'Owner Name',
            hint: 'Owner Name of products.',
            optional: true
          },
          {
            name: 'replacement.id',
            label: 'Replacement Id',
            hint: 'Replacement Id of products.',
            optional: true
          },
          {
            name: 'sourcing.marketplaces',
            label: 'Sourcing Marketplaces',
            hint: 'Sourcing Marketplaces of products.',
            optional: true
          },
          {
            name: 'status',
            label: 'Status',
            hint: 'Status of products.',
            control_type: 'multiselect',
            pick_list: 'product_status',
            delimiter: ',',
            optional: true
          },
          {
            name: 'visibility.catalog',
            label: 'Visibility Catalog',
            hint: 'Visibility Catalog of products.',
            optional: true
          },
          {
            name: 'visibility.listing',
            label: 'Visibility Listing',
            hint: 'Visibility Listing of products.',
            optional: true
          },
          {
            name: 'visibility.owner',
            label: 'Visibility Owner',
            hint: 'Visibility Owner of products.',
            optional: true
          },
          {
            name: 'visibility.syndication',
            label: 'Visibility Syndication',
            hint: 'Visibility Syndication of products.',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = '/public/v1/products'
        operators = {
          eq: ['limit', 'offset', 'category.id', 'groups.id', 'id', 'owner.id', 'replacement.id'],
          ge: ['events.created.at_period_from'],
          le: ['events.created.at_period_to'],
          like: ['name', 'owner.name']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          products_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['products_response']
      end
    },

    search_an_asset: {
      title: 'Locate Assets',
      subtitle: 'Search for Subscriptions on the Connect platform',
      description: 'Use this action to locate specific subscription objects on CloudBlue Connect',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of an asset.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of an asset.',
            optional: true
          },
          {
            name: 'connection.hub.id',
            label: 'Connection Hub Id',
            hint: 'Connection Hub Id of an asset.',
            optional: true
          },
          {
            name: 'connection.id',
            label: 'Connection Id',
            hint: 'Connection Id of an asset.',
            optional: true
          },
          {
            name: 'connection.provider.id',
            label: 'Connection Provider Id',
            hint: 'Connection Provider Id of an asset.',
            optional: true
          },
          {
            name: 'connection.provider.name',
            label: 'Connection Provider Name',
            hint: 'Connection Provider Name of an asset.',
            optional: true
          },
          {
            name: 'connection.type',
            label: 'Connection Type',
            hint: 'Connection Type of an asset.',
            control_type: 'multiselect',
            pick_list: 'tcr_environment',
            delimiter: ',',
            optional: true
          },
          {
            name: 'connection.vendor.id',
            label: 'Connection Vendor Id',
            hint: 'Connection Vendor Id of an asset.',
            optional: true
          },
          {
            name: 'connection.vendor.name',
            label: 'Connection Vendor Name',
            hint: 'Connection Vendor Name of an asset.',
            optional: true
          },
          {
            name: 'contract.id',
            label: 'Contract Id',
            hint: 'Contract Id of an asset.',
            optional: true
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Created Period From of an asset.',
            optional: true
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Created Period To of an asset.',
            optional: true
          },
          {
            name: 'external_id',
            label: 'External Id',
            hint: 'External Id of an asset.',
            optional: true
          },
          {
            name: 'external_uid',
            label: 'External Uid',
            hint: 'External Uid of an asset.',
            optional: true
          },
          {
            name: 'hub.name',
            label: 'Hub Name',
            hint: 'Hub Name of an asset.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of an asset.',
            optional: true
          },
          {
            name: 'marketplace.id',
            label: 'Marketplace Id',
            hint: 'Marketplace Id of an asset.',
            optional: true
          },
          {
            name: 'marketplace.name',
            label: 'Marketplace Name',
            hint: 'Marketplace Name of an asset.',
            optional: true
          },
          {
            name: 'params.id',
            label: 'Params Id',
            hint: 'Params Id of an asset.',
            optional: true
          },
          {
            name: 'params.value',
            label: 'Params Value',
            hint: 'Params Value of an asset.',
            optional: true
          },
          {
            name: 'product.id',
            label: 'Product Id',
            hint: 'Product Id of an asset.',
            optional: true
          },
          {
            name: 'product.title',
            label: 'Product Title',
            hint: 'Product Title of an asset.',
            optional: true
          },
          {
            name: 'status',
            label: 'Status',
            hint: 'Status of an asset.',
            control_type: 'multiselect',
            pick_list: 'asset_status',
            delimiter: ',',
            optional: true
          },
          {
            name: 'tiers.customer.external_id',
            label: 'Tiers Customer External_id',
            hint: 'Tiers Customer External_id of an asset.',
            optional: true
          },
          {
            name: 'tiers.customer.external_uid',
            label: 'Tiers Customer External_uid',
            hint: 'Tiers Customer External_uid of an asset.',
            optional: true
          },
          {
            name: 'tiers.customer.id',
            label: 'Tiers Customer Id',
            hint: 'Tiers Customer Id of an asset.',
            optional: true
          },
          {
            name: 'tiers.customer.name',
            label: 'Tiers Customer Name',
            hint: 'Tiers Customer Name of an asset.',
            optional: true
          },
          {
            name: 'tiers.tier1.id',
            label: 'Tiers Tier1 Id',
            hint: 'Tiers Tier1 Id of an asset.',
            optional: true
          },
          {
            name: 'tiers.tier2.id',
            label: 'Tiers Tier2 Id',
            hint: 'Tiers Tier2 Id of an asset.',
            optional: true
          },
          {
            name: 'updated_period_from',
            type: 'timestamp',
            label: 'Updated Period From',
            hint: 'Updated Period From of an asset.',
            optional: true
          },
          {
            name: 'updated_period_to',
            type: 'timestamp',
            label: 'Updated Period To',
            hint: 'Updated Period To of an asset.',
            optional: true
          }

        ]
      end,

      execute: lambda do |_connection, input|
        uri = '/public/v1/assets'
        operators = {
          eq: [
            'limit', 'offset', 'connection.hub.id', 'connection.id', 'connection.provider.id',
            'connection.vendor.id', 'contract.id', 'external_id', 'id', 'marketplace.id', 'params.id',
            'product.id', 'tiers.customer.external_id', 'tiers.customer.id', 'tiers.tier1.id', 'tiers.tier2.id'
          ],
          gt: %w[created_period_from updated_period_from],
          lt: %w[created_period_to updated_period_to],
          like: [
            'connection.provider.name', 'connection.vendor.name', 'hub.name', 'marketplace.name',
            'tiers.customer.name'
          ]
        }
        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        {
          search_an_asset_response: get(uri)
        }
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['search_an_asset_response']
      end
    },

    create_helpdesk_case: {
      title: 'Helpdesk Case Creation',
      subtitle: 'Create a new Helpdesk Case on CloudBlue Connect',
      description: 'Use this action to create a new helpdesk case on the Connect platform. Your case may (or may not) be related to a particular Product.',
      help: "<a href='https://connect.cloudblue.com/community/modules/helpdesk/user-interface/#Creating_Cases' target='_blank'>Official documentation</a>",
      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'subject',
                          label: 'Subject',
                          hint: 'Provide subject value of Helpdesk Case.',
                          optional: false
                        },
                        {
                          name: 'description',
                          label: 'Description',
                          hint: 'Provide description value of Helpdesk Case.',
                          optional: false
                        },
                        {
                          name: 'priority',
                          label: 'Priority',
                          control_type: 'select',
                          pick_list: 'hc_priority',
                          hint: 'Pick desired Helpdesk Case status.',
                          optional: false
                        },
                        {
                          name: 'type',
                          label: 'Type',
                          control_type: 'select',
                          hint: 'Value of type can be "technical" or "business".',
                          pick_list: 'hc_type',
                          optional: false
                        },
                        {
                          name: 'recipients',
                          label: 'Recipients',
                          hint: 'Provide recipients for this helpdesk case.',
                          optional: true,
                          type: 'array', of: 'object', properties: [
                            { optional: false, name: 'id', label: 'Recipient ID' },
                            { optional: false, name: 'name', label: 'Recipient name' }
                          ]
                        },
                        {
                          name: 'receiver_account_id',
                          label: 'Receiver account ID',
                          hint: 'Provide account ID of helpdesk case receiver.',
                          optional: false
                        },
                        {
                          name: 'product_id',
                          label: 'Product ID',
                          hint: 'Provide unique value identifying product.',
                          optional: true
                        }
                      ]
                    end,
      execute: lambda do |_connection, input|
        product_id = !input['product_id'] ? nil : input['product_id']
        payload = {
          'subject' => (input['subject']).to_s,
          'description' => (input['description']).to_s,
          'priority' => (input['priority']).to_s,
          'type' => (input['type']).to_s,
          'issuer' => {
            'recipients' => (input['recipients'])
          },
          'receiver' => {
            'account' => {
              'id' => (input['receiver_account_id']).to_s
            }
          },
          'product' => if product_id.nil?
                         nil
                       else
                         {
                           'id' => product_id
                         }
                       end
        }
        uri = 'public/v1/helpdesk/cases'
        response = post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
          error("#{message}: #{body}")
        end
      end,
      output_fields: lambda do |object_definitions|
        object_definitions['helpdesk_case_response']
      end
    },

    add_conversation_message: {
      title: 'Add a Conversation Message',
      subtitle: 'Add a Conversation Message on CloudBlue Connect',
      description: 'This actions allows adding messages to existing conversations. Such messages can provide your business partners with valuable information (e.g., reasons why a request is not approved).',
      help: "<a href='https://connect.cloudblue.com/community/modules' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'conversation_id',
                          label: 'Conversation ID',
                          hint: 'Provide unique value identifying this Conversation.',
                          optional: false
                        },
                        {
                          name: 'text',
                          label: 'Text',
                          hint: 'Provide desired message text for this Conversation.',
                          optional: false
                        }
                      ]
                    end,
      execute: lambda do |_connection, input|
        error('Provide conversation ID.') if input['conversation_id'].blank?
        payload = {
          'type': 'message',
          "text": input['text']
        }
        uri = "/public/v1/conversations/#{input['conversation_id']}/messages"
        post(uri, payload)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,
      output_fields: lambda do |object_definitions|
        object_definitions['conversations_messages_response']
      end
    },

    search_a_case: {
      title: 'Locate Helpdesk Cases',
      subtitle: 'Search for required Cases on CloudBlue Connect',
      description: 'This action allows locating specific Helpdek cases on the Connect platform',
      help: "<a href='https://connect.cloudblue.com/community/modules/helpdesk' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of helpdesk cases.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of helpdesk cases.',
            optional: true
          },
          {
            name: 'description',
            label: 'Description',
            hint: 'Description of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.closed.at_period_from',
            type: 'timestamp',
            label: 'Events Closed At_period_from',
            hint: 'Events Closed At_period_from of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.closed.at_period_to',
            type: 'timestamp',
            label: 'Events Closed At_period_to',
            hint: 'Events Closed At_period_to of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.closed.by.id',
            label: 'Events Closed By Id',
            hint: 'Events Closed By Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.closed.by.name',
            label: 'Events Closed By Name',
            hint: 'Events Closed By Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At_period_from',
            hint: 'Events Created At_period_from of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At_period_to',
            hint: 'Events Created At_period_to of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.created.by.id',
            label: 'Events Created By Id',
            hint: 'Events Created By Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.created.by.name',
            label: 'Events Created By Name',
            hint: 'Events Created By Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.inquiring.at_period_from',
            type: 'timestamp',
            label: 'Events Inquiring At_period_from',
            hint: 'Events Inquiring At_period_from of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.inquiring.at_period_to',
            type: 'timestamp',
            label: 'Events Inquiring At_period_to',
            hint: 'Events Inquiring At_period_to of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.inquiring.by.id',
            label: 'Events Inquiring By Id',
            hint: 'Events Inquiring By Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.inquiring.by.name',
            label: 'Events Inquiring By Name',
            hint: 'Events Inquiring By Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.pending.at_period_from',
            type: 'timestamp',
            label: 'Events Pending At_period_from',
            hint: 'Events Pending At_period_from of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.pending.at_period_to',
            type: 'timestamp',
            label: 'Events Pending At_period_to',
            hint: 'Events Pending At_period_to of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.pending.by.id',
            label: 'Events Pending By Id',
            hint: 'Events Pending By Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.pending.by.name',
            label: 'Events Pending By Name',
            hint: 'Events Pending By Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.resolved.at_period_from',
            type: 'timestamp',
            label: 'Events Resolved At_period_from',
            hint: 'Events Resolved At_period_from of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.resolved.at_period_to',
            type: 'timestamp',
            label: 'Events Resolved At_period_to',
            hint: 'Events Resolved At_period_to of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.resolved.by.id',
            label: 'Events Resolved By Id',
            hint: 'Events Resolved By Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.resolved.by.name',
            label: 'Events Resolved By Name',
            hint: 'Events Resolved By Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.updated.at_period_from',
            type: 'timestamp',
            label: 'Events Updated At_period_from',
            hint: 'Events Updated At_period_from of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.updated.at_period_to',
            type: 'timestamp',
            label: 'Events Updated At_period_to',
            hint: 'Events Updated At_period_to of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.updated.by.id',
            label: 'Events Updated By Id',
            hint: 'Events Updated By Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'events.updated.by.name',
            label: 'Events Updated By Name',
            hint: 'Events Updated By Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'issuer.account.id',
            label: 'Issuer Account Id',
            hint: 'Issuer Account Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'issuer.account.name',
            label: 'Issuer Account Name',
            hint: 'Issuer Account Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'issuer.agent.id',
            label: 'Issuer Agent Id',
            hint: 'Issuer Agent Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'issuer.agent.name',
            label: 'Issuer Agent Name',
            hint: 'Issuer Agent Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'priority',
            label: 'Priority',
            hint: 'Priority of helpdesk cases.',
            control_type: 'multiselect',
            pick_list: 'hc_priority',
            delimiter: ',',
            optional: true
          },
          {
            name: 'receiver.account.id',
            label: 'Receiver Account Id',
            hint: 'Receiver Account Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'receiver.account.name',
            label: 'Receiver Account Name',
            hint: 'Receiver Account Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'receiver.agent.id',
            label: 'Receiver Agent Id',
            hint: 'Receiver Agent Id of helpdesk cases.',
            optional: true
          },
          {
            name: 'receiver.agent.name',
            label: 'Receiver Agent Name',
            hint: 'Receiver Agent Name of helpdesk cases.',
            optional: true
          },
          {
            name: 'state',
            label: 'State',
            hint: 'State of helpdesk cases.',
            control_type: 'multiselect',
            pick_list: 'hc_status',
            delimiter: ',',
            optional: true
          },
          {
            name: 'subject',
            label: 'Subject',
            hint: 'Subject of helpdesk cases.',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            hint: 'Type of helpdesk cases.',
            control_type: 'multiselect',
            pick_list: 'hc_type',
            delimiter: ',',
            optional: true
          }
        ]
      end,
      execute: lambda do |_connection, input|
        uri = '/public/v1/helpdesk/cases'
        operators = {
          eq: [
            'limit', 'offset', 'events.closed.by.id', 'events.created.by.id',
            'events.inquiring.by.id', 'events.pending.by.id', 'events.resolved.by.id', 'events.updated.by.id', 'id', 'issuer.account.id', 'issuer.agent.id', 'receiver.account.id', 'receiver.agent.id'
          ],
          gt: [
            'events.closed.at_period_from', 'events.created.at_period_from',
            'events.inquiring.at_period_from', 'events.pending.at_period_from', 'events.resolved.at_period_from', 'events.updated.at_period_from'
          ],
          lt: [
            'events.closed.at_period_to', 'events.created.at_period_to',
            'events.inquiring.at_period_to', 'events.pending.at_period_to', 'events.resolved.at_period_to', 'events.updated.at_period_to'
          ],
          like: [
            'events.closed.by.name', 'events.created.by.name', 'events.inquiring.by.name',
            'events.pending.by.name', 'events.resolved.by.name', 'events.updated.by.name', 'issuer.account.name', 'issuer.agent.name', 'receiver.account.name', 'receiver.agent.name'
          ]
        }
        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)
        uri = uri + q_params
        {
          listing_requests: get(uri)
        }
      end,
      output_fields: lambda do |object_definitions|
        object_definitions['helpdesk_case_response']
      end
    },

    custom_action: {
      title: 'Custom action',
      subtitle: 'Custom action in CloudBlue Connect',
      description: 'Custom action in CloudBlue Connect',
      help: {
        body: 'Build your own CloudBlue Connect action with a HTTP request. The request will be authorized with your connection.',
        learn_more_url: 'https://connect.cloudblue.com/community/api/openapi/',
        learn_more_text: 'CloudBlue Connect API documentation'
      },

      config_fields: [
        {
          name: 'action_name',
          hint: 'Give this action you\'re building a descriptive name, e.g. create record, get record',
          default: 'Custom action',
          optional: false,
          schema_neutral: true
        },

        {
          name: 'verb',
          label: 'Method',
          hint: 'Select HTTP method of the request',
          optional: false,
          control_type: 'select',
          pick_list: %w[get post put patch options delete].map { |verb| [verb.upcase, verb] }
        }

      ],

      input_fields: lambda do |object_definition|
                      object_definition['custom_action_input']
                    end,

      execute: lambda do |_connection, input|
                 verb = input['verb']
                 if %w[get post put patch options delete].exclude?(verb)
                   error("#{verb.upcase} not supported")
                 end

                 path = input['path']
                 data = input.dig('input', 'data') || {}

                 if input['request_type'] == 'multipart'

                   data = data.each_with_object({}) do |(key, val), hash|
                     hash[key] = if val.is_a?(Hash)

                                   [
                                     val[:file_content],

                                     val[:content_type],

                                     val[:original_filename]
                                   ]
                                 else
                                   val
                                 end
                   end
                 end

                 request_headers = input['request_headers']&.each_with_object({}) do |item, hash|
                   hash[item['key']] = item['value']
                 end || {}

                 request = case verb
                           when 'get'
                             get(path, data)
                           when 'post'
                             if input['request_type'] == 'raw'
                               post(path).request_body(data)
                             else
                               post(path, data)
                             end
                           when 'put'
                             if input['request_type'] == 'raw'
                               put(path).request_body(data)
                             else
                               put(path, data)
                             end
                           when 'patch'
                             if input['request_type'] == 'raw'
                               patch(path).request_body(data)
                             else
                               patch(path, data)
                             end

                           when 'options'
                             options(path, data)
                           when 'delete'
                             delete(path, data)
                           end.headers(request_headers)

                 request = case input['request_type']
                           when 'url_encoded_form'
                             request.request_format_www_form_urlencoded
                           when 'multipart'
                             request.request_format_multipart_form
                           else
                             request
                           end
                 response =
                   if input['response_type'] == 'raw'
                     request.response_format_raw
                   else
                     request
                   end

                 response.after_error_response(/.*/) do |code, body, headers, message|
                   error({ code: code, message: message, body: body, headers: headers }.to_json)
                 end

                 response.after_response do |_code, res_body, res_headers|
                   {
                     body: res_body ? call('format_response', res_body) : nil,
                     headers: res_headers
                   }
                 end
               end,

      output_fields: lambda do |object_definition|
                       object_definition['custom_action_output']
                     end

    }

  },

  triggers: {
    new_or_updated_asset_request: {
      title: 'New/Updated Asset Request is Available',
      subtitle: 'New or updated Fulfillment Request is available on the Connect platform',
      description: 'This trigger activates once a new or updated subscription request is available for your specified Connect account. ',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/fulfillment-requests/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |object_definitions|
        object_definitions['requests_inputs']
      end,

      poll: lambda do |_connection, input, last_updated_since|
              updated_since = (last_updated_since || input['updated_period_from']).to_time.utc
              input['updated_period_from'] = updated_since

              uri = '/public/v1/requests'
              operators = {
                eq: [
                  'limit', 'offset', 'asset.account_id', 'asset.connection.hub.id', 'asset.connection.id', 'asset.connection.provider.id',
                  'asset.connection.vendor.id', 'asset.contract.id', 'asset.external.id', 'asset.external_id',
                  'asset.id', 'asset.marketplace.id', 'asset.params.id', 'asset.product.id', 'asset.tier1_id',
                  'asset.tier2_id', 'asset.tiers.tier1.id', 'asset.tiers.tier2.id',
                  'asset__connection__hub__id', 'asset__connection__provider__id', 'asset__connection__vendor__id',
                  'asset__id', 'asset__product__id', 'asset__tiers__tier1__id', 'asset__tiers__tier2__id',
                  'asset_id', 'contract.id', 'contract__id', 'id', 'marketplace.id', 'product_id'
                ],
                gt: %w[created_period_from updated_period_from],
                lt: %w[created_period_to updated_period_to],
                like: [
                  'asset.connection.hub.name', 'asset.connection.provider.name', 'asset.connection.vendor.name',
                  'asset.marketplace.name', 'asset.product.name', 'asset.tiers.customer.name', 'asset__connection__hub__name',
                  'asset__connection__provider__name', 'asset__connection__vendor__name', 'asset__product__name', 'marketplace.name',
                  'marketplace__name', 'asset.tiers.customer.id', 'asset__tiers__customer__id'
                ]
              }

              q_params = ''
              q_params = call(:form_query_params, input, q_params, operators)
              uri = uri + q_params

              all_items = get(uri)
              response = []
              one_time_elements = []
              recurring_elements = []
              all_items.each do |item|
                if item['asset']['items'][0]['period'] == 'OneTime'
                  one_time_elements.push(item)
                else
                  recurring_elements.push(item)
                end
              end

              requests = input['asset_type'] == 'recurring' ? recurring_elements : one_time_elements

              requests.each do |request|
                updated_since = [updated_since, request['updated'].to_time.utc].max
              end

              {
                events: requests,
                next_poll: updated_since.iso8601,
                can_poll_more: (!input['limit'].blank? && all_items.length >= input['limit'].to_i)
              }
            end,

      dedup: lambda do |request|
               request['id'] + request['status']
             end,

      output_fields: lambda do |object_definitions|
                       object_definitions['search_recurring_assets_response']
                     end
    },

    new_recurring_asset: {
      title: 'New Recurring Asset is Created',
      subtitle: 'New Recurring Subscription is Created on CloudBlue Connect',
      description: 'This trigger is activated once a recurring subscription is created on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/subscriptions/' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
        [
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of products.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of products.',
            optional: true
          },
          {
            name: 'billing.next_date_period_from',
            type: 'timestamp',
            label: 'Billing Next_date Period From',
            hint: 'Billing Next_date Period From of products.',
            optional: false
          },
          {
            name: 'billing.next_date_period_to',
            type: 'timestamp',
            label: 'Billing Next_date Period To',
            hint: 'Billing Next_date Period To of products.',
            optional: true
          },
          {
            name: 'billing.period.uom',
            label: 'Billing Period Uom',
            hint: 'Billing Period Uom of products.',
            pick_list: 'asset_billing_period',
            control_type: 'multiselect',
            delimiter: ',',
            optional: true
          },
          {
            name: 'connection.hub.id',
            label: 'Connection Hub Id',
            hint: 'Connection Hub Id of products.',
            optional: true
          },
          {
            name: 'connection.hub.name',
            label: 'Connection Hub Name',
            hint: 'Connection Hub Name of products.',
            optional: true
          },
          {
            name: 'connection.id',
            label: 'Connection Id',
            hint: 'Connection Id of products.',
            optional: true
          },
          {
            name: 'connection.provider.id',
            label: 'Connection Provider Id',
            hint: 'Connection Provider Id of products.',
            optional: true
          },
          {
            name: 'connection.provider.name',
            label: 'Connection Provider Name',
            hint: 'Connection Provider Name of products.',
            optional: true
          },
          {
            name: 'connection.type',
            label: 'Connection Type',
            hint: 'Connection Type of products.',
            pick_list: 'connection_type',
            control_type: 'multiselect',
            delimiter: ',',
            optional: true
          },
          {
            name: 'connection.vendor.id',
            label: 'Connection Vendor Id',
            hint: 'Connection Vendor Id of products.',
            optional: true
          },
          {
            name: 'connection.vendor.name',
            label: 'Connection Vendor Name',
            hint: 'Connection Vendor Name of products.',
            optional: true
          },
          {
            name: 'contract.id',
            label: 'Contract Id',
            hint: 'Contract Id of products.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of products.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of products.',
            optional: true
          },
          {
            name: 'events.updated.at_period_from',
            type: 'timestamp',
            label: 'Events Updated At Period From',
            hint: 'Events Updated At Period From of products.',
            optional: true
          },
          {
            name: 'events.updated.at_period_to',
            type: 'timestamp',
            label: 'Events Updated At Period To',
            hint: 'Events Updated At Period To of products.',
            optional: true
          },
          {
            name: 'external_id',
            label: 'External Id',
            hint: 'External Id of products.',
            optional: true
          },
          {
            name: 'external_uid',
            label: 'External Uid',
            hint: 'External Uid of products.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of products.',
            optional: true
          },
          {
            name: 'marketplace.id',
            label: 'Marketplace Id',
            hint: 'Marketplace Id of products.',
            optional: true
          },
          {
            name: 'marketplace.name',
            label: 'Marketplace Name',
            hint: 'Marketplace Name of products.',
            optional: true
          },
          {
            name: 'product.id',
            label: 'Product Id',
            hint: 'Product Id of products.',
            optional: true
          },
          {
            name: 'product.name',
            label: 'Product Name',
            hint: 'Product Name of products.',
            optional: true
          },
          {
            name: 'status',
            label: 'Status',
            hint: 'Status of products.',
            pick_list: 'asset_status',
            control_type: 'multiselect',
            delimiter: ',',
            optional: true
          },
          {
            name: 'tiers.customer.id',
            label: 'Tiers Customer Id',
            hint: 'Tiers Customer Id of products.',
            optional: true
          },
          {
            name: 'tiers.tier1.id',
            label: 'Tiers Tier1 Id',
            hint: 'Tiers Tier1 Id of products.',
            optional: true
          },
          {
            name: 'tiers.tier2.id',
            label: 'Tiers Tier2 Id',
            hint: 'Tiers Tier2 Id of products.',
            optional: true
          }
        ]
      end,

      poll: lambda do |_connection, input, last_updated_since|
              updated_since = (last_updated_since || input['billing.next_date_period_from']).to_time.utc

              uri = '/public/v1/subscriptions/assets'
              operators = {
                eq: [
                  'limit', 'offset', 'connection.hub.id', 'connection.id',
                  'connection.provider.id', 'connection.vendor.id', 'contract.id', 'external_id', 'id', 'marketplace.id', 'product.id', 'tiers.customer.id', 'tiers.tier1.id', 'tiers.tier2.id'
                ],
                gt: [
                  'billing.next_date_period_from', 'events.created.at_period_from',
                  'events.updated.at_period_from'
                ],
                lt: [
                  'billing.next_date_period_to', 'events.created.at_period_to',
                  'events.updated.at_period_to'
                ],
                like: [
                  'connection.hub.name', 'connection.provider.name', 'connection.vendor.name',
                  'marketplace.name', 'product.name'
                ]
              }

              q_params = ''
              q_params = call(:form_query_params, input, q_params, operators)
              uri = uri + q_params

              all_items = get(uri)

              all_items.each do |item|
                updated_since = [updated_since, item['events']['created']['at'].to_time.utc].max
              end

              {
                events: all_items,
                next_poll: updated_since.iso8601,
                can_poll_more: (!input['limit'].blank? && all_items.length >= input['limit'].to_i)
              }
            end,

      dedup: lambda do |all_items|
               all_items['id'] + all_items['status']
             end,

      output_fields: lambda do |object_definitions|
                       object_definitions['search_recurring_assets_response']
                     end
    },

    new_usage_files: {
      title: 'New Usage File is Available',
      subtitle: 'New Usage File is available on the Connect platform',
      description: 'This trigger activates once a new usage file is available for your specified Connect account.',
      help: "<a href='https://connect.cloudblue.com/community/modules/usage_module/' target='_blank'>Official documentation</a>",

      input_fields: lambda do
        [
          {
            name: 'provider_id',
            label: 'Provider ID',
            optional: true
          },
          {
            name: 'file_status',
            label: 'Status of usage file',
            control_type: 'multiselect',
            delimiter: ',',
            pick_list: 'usage_files_status',
            hint: 'Please choose status(es) which usage file should have.',
            optional: true
          },
          {
            name: 'since',
            type: :timestamp,
            optional: false
          },
          {
            name: 'delay',
            type: :integer,
            default: '0',
            optional: true
          }
        ]
      end,

      poll: lambda do |_connection, input, last_updated_since|
        updated_since = (last_updated_since || input['since']).to_time.utc
        adjusted_updated_since = updated_since + input['delay'].to_i.days

        uri = '/public/v1/usage/files?'
        uri = uri + (!input['provider_id'].blank? ? "eq(provider.id,#{input['provider_id']})," : '')
        uri = uri + (!input['file_status'].blank? ? "in(status,(#{input['file_status']}))," : '')
        uri = uri + "ge(created.at,#{adjusted_updated_since.iso8601})"

        files = get(uri)

        files.each do |file|
          updated_since = [updated_since, file['events']['created']['at'].to_time.utc].max
        end

        {
          events: files,
          next_poll: updated_since.iso8601,
          can_poll_more: false
        }
      end,

      dedup: lambda do |files|
        files['id'] + files['status']
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['usage_file']
      end
    },

    get_conversations_messages: {
      title: 'Get Conversation Messages',
      subtitle: 'Locate required Conversation Messages on the Connect platform',
      description: 'This action allows locating specific conversation messages on the Connect platform',
      help: "<a href='https://connect.cloudblue.com/community/modules' target='_blank'>Official documentation</a>",

      input_fields: lambda do
        [
          {
            name: 'conversation_id',
            label: 'Conversation ID',
            optional: false
          },
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Number of results to return per page.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'The initial index from which to return the results.',
            optional: true
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Period From created Comments/Messages.',
            optional: false
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Period To created Comments/Messages.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of Comments/Messages.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of Comments/Messages.',
            optional: true
          },
          {
            name: 'events.created.by.id',
            label: 'Events Created By Id',
            hint: 'Events Created By Id of Comments/Messages.',
            optional: true
          },
          {
            name: 'events.updated.at_period_from',
            type: 'timestamp',
            label: 'Events Updated At Period From',
            hint: 'Events Updated At Period From of Comments/Messages.',
            optional: true
          },
          {
            name: 'events.updated.at_period_to',
            type: 'timestamp',
            label: 'Events Updated At Period To',
            hint: 'Events Updated At Period To of Comments/Messages.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of Comments/Messages.',
            optional: true
          },
          {
            name: 'text',
            label: 'Text',
            hint: 'Text of Comments/Messages.',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            pick_list: 'hc_message_type',
            control_type: 'multiselect',
            delimiter: ',',
            hint: 'Choose value of type',
            optional: true
          }
        ]
      end,

      poll: lambda do |_connection, input, last_updated_since|
        updated_since = (last_updated_since || input['created_period_from']).to_time.utc

        uri = "/public/v1/conversations/#{input['conversation_id']}/messages"
        operators = {
          in: ['limit', 'offset', 'events.created.by.id', 'id', 'type'],
          gt: [
            'created_period_from', 'events.created.at_period_from',
            'events.updated.at_period_from'
          ],
          lt: ['created_period_to', 'events.created.at_period_to', 'events.updated.at_period_to'],
          like: ['text']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        conversations = get(uri)

        conversations.each do |conversation|
          updated_since = [updated_since, conversation['created'].to_time.utc].max
        end

        {
          events: conversations,
          next_poll: updated_since.iso8601,
          can_poll_more: (!input['limit'].blank? && conversations.length >= input['limit'].to_i)
        }
      end,

      dedup: lambda do |conversations|
        conversations['id']
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['conversations_messages_response']
      end
    },

    get_conversations: {
      title: 'New Conversation is Started',
      subtitle: 'New Conversation is Started on CloudBlue Connect',
      description: 'This trigger is activated once a new conversation is started on the Connect platform',
      help: "<a href='https://connect.cloudblue.com/community/modules' target='_blank'>Official documentation</a>",

      input_fields: lambda do
        [
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of Conversations.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of Conversations.',
            optional: true
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Created Period From of Conversations.',
            optional: false
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Created Period To of Conversations.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of Conversations.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of Conversations.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of Conversations.',
            optional: true
          },
          {
            name: 'instance_id',
            label: 'Instance Id',
            hint: 'Instance Id of Conversations.',
            optional: true
          }
        ]
      end,

      poll: lambda do |_connection, input, last_updated_since|
        updated_since = (last_updated_since || input['created_period_from']).to_time.utc

        uri = '/public/v1/conversations'
        operators = {
          eq: %w[limit offset id instance_id],
          gt: ['created_period_from', 'events.created.at_period_from'],
          lt: ['created_period_to', 'events.created.at_period_to']
        }

        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)

        uri = uri + q_params

        conversations = get(uri)

        conversations.each do |conversation|
          updated_since = [updated_since, conversation['created'].to_time.utc].max
        end

        {
          events: conversations,
          next_poll: updated_since.iso8601,
          can_poll_more: (!input['limit'].blank? && conversations.length >= input['limit'].to_i)
        }
      end,

      dedup: lambda do |conversations|
        conversations['id'] + conversations['status']
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['conversations_response']
      end
    },

    new_case_comment: {
      title: 'New Case Comment',
      subtitle: 'Create a Helpdesk Case Comment on CloudBlue Connect',
      description: 'This action allows creating a new helpdesk case comment on the CloudBlue Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/helpdesk/' target='_blank'>Official documentation</a>",

      input_fields: lambda do
        [
          {
            name: 'id',
            label: 'ID',
            optional: false
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Created Period From of Case comment.',
            optional: false
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Created Period To of Case comment.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of Case comment.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of Case comment.',
            optional: true
          },
          {
            name: 'since',
            type: :timestamp,
            optional: false
          },
          {
            name: 'delay',
            type: :integer,
            default: '0',
            optional: true
          }
        ]
      end,
      poll: lambda do |_connection, input, last_updated_since|
        updated_since = (last_updated_since || input['created_period_from']).to_time.utc

        uri = "/public/v1/helpdesk/cases/#{input['id']}"

        helpdesk_cases = get(uri)
        updated_since = [updated_since, helpdesk_cases['events']['created']['at'].to_time.utc].max
        {
          events: helpdesk_cases,
          next_poll: updated_since.iso8601,
          can_poll_more: false
        }
      end,
      dedup: lambda do |helpdesk_cases|
        helpdesk_cases['id']
      end,
      output_fields: lambda do |object_definitions|
        object_definitions['helpdesk_case_response']
      end
    },

    new_case: {
      title: 'New Case is Created',
      subtitle: 'New Case is Created on the Connect platform',
      description: 'This trigger is activated once a new case is created on the Connect platform.',
      help: "<a href='https://connect.cloudblue.com/community/modules/helpdesk' target='_blank'>Official documentation</a>",

      input_fields: lambda do
        [
          {
            name: 'limit',
            label: 'Limit',
            hint: 'Limit of new helpdesk case.',
            optional: true
          },
          {
            name: 'offset',
            label: 'Offset',
            hint: 'Offset of new helpdesk case.',
            optional: true
          },
          {
            name: 'description',
            label: 'Description',
            hint: 'Description of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.closed.at_period_from',
            type: 'timestamp',
            label: 'Events Closed At Period From',
            hint: 'Events Closed At Period From of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.closed.at_period_to',
            type: 'timestamp',
            label: 'Events Closed At Period To',
            hint: 'Events Closed At Period To of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.closed.by.id',
            label: 'Events Closed By Id',
            hint: 'Events Closed By Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.closed.by.name',
            label: 'Events Closed By Name',
            hint: 'Events Closed By Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.created.by.id',
            label: 'Events Created By Id',
            hint: 'Events Created By Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.created.by.name',
            label: 'Events Created By Name',
            hint: 'Events Created By Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.inquiring.at_period_from',
            type: 'timestamp',
            label: 'Events Inquiring At Period From',
            hint: 'Events Inquiring At Period From of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.inquiring.at_period_to',
            type: 'timestamp',
            label: 'Events Inquiring At Period To',
            hint: 'Events Inquiring At Period To of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.inquiring.by.id',
            label: 'Events Inquiring By Id',
            hint: 'Events Inquiring By Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.inquiring.by.name',
            label: 'Events Inquiring By Name',
            hint: 'Events Inquiring By Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.pending.at_period_from',
            type: 'timestamp',
            label: 'Events Pending At Period From',
            hint: 'Events Pending At Period From of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.pending.at_period_to',
            type: 'timestamp',
            label: 'Events Pending At Period To',
            hint: 'Events Pending At Period To of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.pending.by.id',
            label: 'Events Pending By Id',
            hint: 'Events Pending By Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.pending.by.name',
            label: 'Events Pending By Name',
            hint: 'Events Pending By Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.resolved.at_period_from',
            type: 'timestamp',
            label: 'Events Resolved At Period From',
            hint: 'Events Resolved At Period From of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.resolved.at_period_to',
            type: 'timestamp',
            label: 'Events Resolved At Period To',
            hint: 'Events Resolved At Period To of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.resolved.by.id',
            label: 'Events Resolved By Id',
            hint: 'Events Resolved By Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.resolved.by.name',
            label: 'Events Resolved By Name',
            hint: 'Events Resolved By Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.updated.at_period_from',
            type: 'timestamp',
            label: 'Events Updated At Period From',
            hint: 'Events Updated At Period From of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.updated.at_period_to',
            type: 'timestamp',
            label: 'Events Updated At Period To',
            hint: 'Events Updated At Period To of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.updated.by.id',
            label: 'Events Updated By Id',
            hint: 'Events Updated By Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'events.updated.by.name',
            label: 'Events Updated By Name',
            hint: 'Events Updated By Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'id',
            label: 'Id',
            hint: 'Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'issuer.account.id',
            label: 'Issuer Account Id',
            hint: 'Issuer Account Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'issuer.account.name',
            label: 'Issuer Account Name',
            hint: 'Issuer Account Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'issuer.agent.id',
            label: 'Issuer Agent Id',
            hint: 'Issuer Agent Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'issuer.agent.name',
            label: 'Issuer Agent Name',
            hint: 'Issuer Agent Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'priority',
            label: 'Priority',
            pick_list: 'hc_priority',
            control_type: 'multiselect',
            delimiter: ',',
            hint: 'Priority of new helpdesk case.',
            optional: true
          },
          {
            name: 'receiver.account.id',
            label: 'Receiver Account Id',
            hint: 'Receiver Account Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'receiver.account.name',
            label: 'Receiver Account Name',
            hint: 'Receiver Account Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'receiver.agent.id',
            label: 'Receiver Agent Id',
            hint: 'Receiver Agent Id of new helpdesk case.',
            optional: true
          },
          {
            name: 'receiver.agent.name',
            label: 'Receiver Agent Name',
            hint: 'Receiver Agent Name of new helpdesk case.',
            optional: true
          },
          {
            name: 'state',
            label: 'State',
            pick_list: 'hc_state',
            control_type: 'multiselect',
            delimiter: ',',
            hint: 'State of new helpdesk case.',
            optional: true
          },
          {
            name: 'subject',
            label: 'Subject',
            hint: 'Subject of new helpdesk case.',
            optional: true
          },
          {
            name: 'type',
            label: 'Type',
            pick_list: 'hc_type',
            control_type: 'multiselect',
            delimiter: ',',
            hint: 'Choose value of type.',
            optional: true
          },
          {
            name: 'created_period_from',
            type: 'timestamp',
            label: 'Created Period From',
            hint: 'Created Period From of Helpdesk Cases.',
            optional: false
          },
          {
            name: 'created_period_to',
            type: 'timestamp',
            label: 'Created Period To',
            hint: 'Created Period To of Helpdesk Cases.',
            optional: true
          },
          {
            name: 'events.created.at_period_from',
            type: 'timestamp',
            label: 'Events Created At Period From',
            hint: 'Events Created At Period From of Helpdesk Cases.',
            optional: true
          },
          {
            name: 'events.created.at_period_to',
            type: 'timestamp',
            label: 'Events Created At Period To',
            hint: 'Events Created At Period To of Helpdesk Cases.',
            optional: true
          }
        ]
      end,
      poll: lambda do |_connection, input, last_updated_since|
        updated_since = (last_updated_since || input['created_period_from']).to_time.utc

        uri = '/public/v1/helpdesk/cases'
        operators = {
          in: [
            'limit', 'offset', 'events.closed.by.id', 'events.created.by.id',
            'events.inquiring.by.id', 'events.pending.by.id', 'events.resolved.by.id', 'events.updated.by.id', 'id', 'issuer.account.id', 'issuer.agent.id', 'receiver.account.id', 'receiver.agent.id', 'type', 'state', 'priority'
          ],
          gt: [
            'events.closed.at_period_from', 'events.created.at_period_from',
            'events.inquiring.at_period_from', 'events.pending.at_period_from', 'events.resolved.at_period_from', 'events.updated.at_period_from'
          ],
          lt: [
            'events.closed.at_period_to', 'events.created.at_period_to',
            'events.inquiring.at_period_to', 'events.pending.at_period_to', 'events.resolved.at_period_to', 'events.updated.at_period_to'
          ],
          like: [
            'events.closed.by.name', 'events.created.by.name', 'events.inquiring.by.name',
            'events.pending.by.name', 'events.resolved.by.name', 'events.updated.by.name', 'issuer.account.name', 'issuer.agent.name', 'receiver.account.name', 'receiver.agent.name'
          ]
        }
        q_params = ''
        q_params = call(:form_query_params, input, q_params, operators)
        uri = uri + q_params
        new_cases = get(uri)
        new_cases.each do |new_cases|
          updated_since = [updated_since, new_cases['events']['created']['at'].to_time.utc].max
        end
        {
          events: new_cases,
          next_poll: updated_since.iso8601,
          can_poll_more: (!input['limit'].blank? && new_cases.length >= input['limit'].to_i)
        }
      end,
      dedup: lambda do |new_cases|
               new_cases['id']
             end,
      output_fields: lambda do |object_definitions|
                       object_definitions['helpdesk_case_response']
                     end
    }

  },

  pick_lists: {
    br_period_uom: lambda do |_connection|
      [
        %w[Monthly monthly],
        %w[Yearly yearly]
      ]
    end,

    br_type: lambda do |_connection|
      [
        %w[Provider provider],
        %w[Vendor vendor]
      ]
    end,

    usage_files_status: lambda do |_connection|
      [
        %w[Draft draft],
        %w[Uploading uploading],
        %w[Uploaded uploaded],
        %w[Invalid invalid],
        %w[Processing processing],
        %w[Ready ready],
        %w[Rejected rejected],
        %w[Pending pending],
        %w[Accepted accepted],
        %w[Closed closed],
        %w[Deleted deleted]
      ]
    end,

    lr_status: lambda do |_connection|
      [
        %w[Assign assign],
        %w[Cancel cancel],
        %w[Complete complete],
        %w[Deploy deploy],
        %w[Refine refine],
        %w[Submit submit],
        %w[Unassign unassign]
      ]
    end,
    fr_status: lambda do |_connection|
      [
        %w[Pending pending],
        ['Tiers Setup', 'tiers_setup'],
        %w[Inquiring inquiring],
        %w[Approved approved],
        %w[Failed failed],
        %w[Draft draft],
        %w[Revoking revoking],
        %w[Revoked revoked],
        %w[Scheduled scheduled]
      ]
    end,

    connection_type: lambda do |_connection|
      [
        %w[Production production],
        %w[Test test],
        %w[Preview preview]
      ]
    end,
    asset_status: lambda do |_connection|
      [
        %w[Active active],
        %w[Draft draft],
        %w[Processing processing],
        %w[Suspended suspended],
        %w[Terminating terminating],
        %w[Terminated terminated]
      ]
    end,
    param_type: lambda do |_connection|
      [
        %w[Text str],
        %w[Number int],
        %w[Float float],
        %w[Boolean bool]
      ]
    end,

    request_type: lambda do |_connection|
      [
        %w[Suspend suspend],
        %w[Resume resume]
      ]
    end,

    asset_type: lambda do |_connection|
      [
        %w[Recurring recurring],
        ['One time', 'perpetual']
      ]
    end,

    hc_status: lambda do |_connection|
      [
        %w[Inquire inquire],
        %w[Pending pend],
        %w[Resolve resolve],
        %w[Close close]
      ]
    end,

    hc_state: lambda do |_connection|
      [
        %w[Pending pending],
        %w[Inquiring inquiring],
        %w[Resolved resolved],
        %w[Closed closed]
      ]
    end,

    hc_priority: lambda do |_connection|
      [
        %w[Low 0],
        %w[Medium 1],
        %w[High 2],
        %w[Urgent 3]
      ]
    end,
    hc_type: lambda do |_connection|
      [
        %w[Technical technical],
        %w[Business business]
      ]
    end,
    hc_message_type: lambda do |_connection|
      [
        %w[Message message],
        ['State changed', 'state_change'],
        %w[Private private]
      ]
    end,
    tar_status: lambda do |_connection|
      [
        %w[Pending pending],
        %w[Accepted accepted],
        %w[Unsupported unsupported],
        %w[Ignored ignored]
      ]
    end,
    tcr_type: lambda do |_connection|
      [
        %w[Setup setup],
        %w[Update update],
        %w[Adjustment adjustment]
      ]
    end,
    tcr_tier_level: lambda do |_connection|
      [
        %w[1 1],
        %w[2 2]
      ]
    end,
    tcr_environment: lambda do |_connection|
      [
        %w[Production production],
        %w[Test test]
      ]
    end,
    tc_account_type: lambda do |_connection|
      [
        %w[Customer customer],
        %w[Reseller reseller]
      ]
    end,
    listing_requests_state: lambda do |_connection|
      [
        %w[Draft draft],
        %w[Reviewing reviewing],
        %w[Deploying deploying],
        %w[Canceled canceled],
        %w[Completed completed]
      ]
    end,
    listing_requests_type: lambda do |_connection|
      [
        %w[New new],
        %w[Remove remove]
      ]
    end,
    listing_requests_status: lambda do |_connection|
      [
        %w[Unlisted unlisted],
        %w[Listed listed]
      ]
    end,
    product_item_type: lambda do |_connection|
      [
        %w[Reservation Reservation],
        %w[PPU PPU]
      ]
    end,
    product_item_period: lambda do |_connection|
      [
        %w[Monthly monthly],
        %w[Yearly yearly],
        ['Two years', 'years_2'],
        ['Three years', 'years_3'],
        ['Four years', 'years_4'],
        ['Five years', 'years_5'],
        ['One Time', 'OneTime']
      ]
    end,
    product_item_status: lambda do |_connection|
      [
        %w[Draft draft],
        %w[Published published],
        ['End of sale', 'endofsale']
      ]
    end,
    product_item_usage_data_type: lambda do |_connection|
      [
        %w[Integer Integer],
        %w[Decimal(1) Decimal(1)],
        %w[Decimal(2) Decimal(2)],
        %w[Decimal(4) Decimal(4)],
        %w[Decimal(8) Decimal(8)]
      ]
    end,
    product_parametar_phase: lambda do |_connection|
      [
        %w[Configuration configuration],
        %w[Fulfillment fulfillment],
        %w[Ordering ordering]
      ]
    end,
    product_parametar_scope: lambda do |_connection|
      [
        %w[Asset asset],
        ['Tier 1', 'tier1'],
        ['Tier 2', 'tier2'],
        %w[Product product],
        %w[Item item],
        %w[Marketplace marketplace],
        ['Item marketplace' 'item_marketplace']
      ]
    end,
    product_parametar_type: lambda do |_connection|
      [
        %w[Text text],
        %w[Dropdown dropdown],
        %w[Password password],
        %w[Email email],
        %w[Checkbox checkbox],
        %w[Subdomain subdomain],
        %w[Domain domain],
        %w[Address address],
        %w[Phone phone],
        %w[Object object],
        %w[URL url],
        %w[Choice choice]
      ]
    end,
    asset_billing_period: lambda do |_connection|
      [
        %w[Monthly monthly],
        %w[Yearly yearly],
        ['Two years', 'years_2'],
        ['Three years', 'years_3'],
        ['Four years', 'years_4'],
        ['Five years', 'years_5']
      ]
    end,
    product_status: lambda do |_connection|
      [
        %w[Draft draft],
        ['In development', 'indevelopment'],
        ['On certification', 'oncertification'],
        %w[Published published],
        ['Initialization failed', 'initializationfailed'],
        %w[Deleted deleted],
        ['End of sale', 'endofsale']
      ]
    end,
    type_of_an_asset: lambda do |_connection|
      [
        %w[Purchase purchase],
        %w[Cancel cancel],
        %w[Change change],
        %w[Suspend suspend],
        %w[Resume resume],
        %w[Adjustment adjustment]
      ]
    end
  }

}
