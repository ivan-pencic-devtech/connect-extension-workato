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

    fr_response: {
      fields: lambda do
        [
          { name: 'id' },
          { name: 'type' },
          { name: 'error_code' },
          { name: 'note' },
          { name: 'status' },
          { name: 'params_form_url' },
          { name: 'asset', type: 'object', properties: [
            { name: 'id' },
            { name: 'external_id' },
            { name: 'external_uid' }
          ] },
          { name: 'errors', type: 'array' },
          { name: 'customer_external_uid' },
          { name: 'asset_external_uid' },
          { name: 'tier1_external_uid' }
        ]
      end
    },
    usage_records: {
      fields: lambda do 
[{
  name: "records",
  type: "array",
  properties: [{
    name: "id"
  }, {
    name: "start_date"
  }, {
    name: "end_date"
  }, {
    name: "product_id"
  }, {
    name: "external_billing_id"
  }, {
    name: "external_billing_note"
  }, {
    name: "item",
    type: "object",
    properties: [{
      name: "id"
    }, {
      name: "local_id"
    }, {
      name: "mpn"
    }, {
      name: "name"
    }]
  }, {
    name: "asset",
    type: "object",
    properties: [{
      name: "id"
    }, {
      name: "external_id"
    }, {
      name: "external_uid"
    }]
  }, {
    name: "multiplier"
  }, {
    name: "usage"
  }, {
    name: "status"
  }, {
    name: "closed_at"
  }, {
    name: "closed_by"
  }, {
    name: "params",
    type: "array",
    properties: []
  }, {
    name: "item_id"
  }, {
    name: "asset_id"
  }, {
    name: "usagefile",
    type: "object",
    properties: [{
      name: "id"
    }, {
      name: "name"
    }, {
      name: "schema"
    }]
  }, {
    name: "resource_local_id"
  }, {
    name: "asset_external_id"
  }, {
    name: "asset_external_uid"
  }]
}
]
      end
    },
    usage_file: {
      fields: lambda do
        [{
       name: "id"
     },
     {
       name: "name"
     },
     {
       name: "status"
     },
     {
       name: "vendor",
       type: "object",
       properties: [{
           name: "id"
         },
         {
           name: "name"
         }
       ]
     },
     {
       name: "provider",
       type: "object",
       properties: [{
           name: "id"
         },
         {
           name: "name"
         }
       ]
     },
     {
       name: "environment"
     },
     {
       name: "marketplace",
       type: "object",
       properties: [{
           name: "id"
         },
         {
           name: "name"
         },
         {
           name: "icon"
         }
       ]
     },
     {
       name: "contract",
       type: "object",
       properties: [{
           name: "id"
         },
         {
           name: "name"
         }
       ]
     },
     {
       name: "product",
       type: "object",
       properties: [{
           name: "id"
         },
         {
           name: "name"
         },
         {
           name: "icon"
         }
       ]
     },
     {
       name: "acceptance_note"
     },
     {
       name: "schema"
     },
     {
       name: "period",
       type: "object",
       properties: [{
           name: "from"
         },
         {
           name: "to"
         }
       ]
     },
     {
       name: "stats",
       type: "object",
       properties: [{
           name: "uploaded"
         },
         {
           name: "validated"
         },
         {
           name: "pending"
         },
         {
           name: "accepted"
         },
         {
           name: "closed"
         }
       ]
     },
     {
       name: "events",
       type: "object",
       properties: [{
           name: "created",
           type: "object",
           properties: [{
               name: "at"
             },
             {
               name: "by",
               type: "object",
               properties: [{
                   name: "id"
                 },
                 {
                   name: "name"
                 }
               ]
             }
           ]
         },
         {
           name: "accepted",
           type: "object",
           properties: [{
               name: "at"
             },
             {
               name: "by",
               type: "object",
               properties: [{
                 name: "name"
               }]
             }
           ]
         },
         {
           name: "closed",
           type: "object",
           properties: [{
               name: "at"
             },
             {
               name: "by",
               type: "object",
               properties: [{
                 name: "name"
               }]
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
          { name: 'created' },
          { name: 'updated' },
          { name: 'answered''note' },
          { name: 'reason' },
          { name: 'assignee' },
          { name: 'activation_key' },
          { name: 'status' },
          { name: 'asset', type: 'object', properties: [
            { name: 'id' },
            { name: 'status' },
            { name: 'external_id' },
            { name: 'external_uid' },
            { name: 'product', type: 'object', properties: [
              { name: 'id' },
              { name: 'icon' },
              { name: 'name' },
              { name: 'status' }
            ] },
            # skipped connection and events structures
            { name: 'items', type: 'array', properties: [
              { name: 'id' },
              { name: 'global_id' },
              { name: 'mpn' },
              { name: 'old_quantity' },
              { name: 'quantity' },
              { name: 'type' },
              { name: 'display_name' },
              { name: 'period' },
              { name: 'item_type' }
            ] },
            # skipped params array, tiers and configuration structures
            { name: 'marketplace', type: 'object', properties: [
              { name: 'id' },
              { name: 'name' },
              { name: 'icon' }
            ] }
            # skipped contract structure
          ] }
        ]
      end
    }
  },
  # Reusable methods can be called from object_definitions, picklists or actions
  # See more at https://docs.workato.com/developing-connectors/sdk/sdk-reference/methods.html
  methods: {

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
                               end
  },

  actions: {

    asset_cancel_request: {
      title: 'Asset Cancel Request',
      subtitle: '',
      description: '',
      help: "<a href='https://connect.cloudblue.com/community/api/openapi/#operations-Assets-request_list_createRequest' target='_blank'>Official documentation</a>",

      input_fields: lambda do |_object_definitions|
                      [
                        {
                          name: 'external_id',
                          label: 'External ID',
                          hint: 'Provide the External ID of the Asset that you want to cancel.',
                          optional: false
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
        params = {
          "type": 'cancel',
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


    asset_suspend_resume_request: {
      title: 'Asset Suspend/Resume Request',
      subtitle: '',
      description: '',
      help: "<a href='https://connect.cloudblue.com/community/api/openapi/#operations-Assets-request_list_createRequest' target='_blank'>Official documentation</a>",

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
    
    
    asset_purchase_request: {
      title: 'Asset Purchase Request',
      subtitle: '',
      description: '',
      help: "<a href='https://connect.cloudblue.com/community/api/openapi/#operations-Assets-request_list_createRequest' target='_blank'>Official documentation</a>",

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
                          name: 'tier1_external_id',
                          label: 'Tier 1 External ID',
                          hint: "Provide the ID of the Tier 1 on the external system that will help you identify the account on Connect platform. Please note that vendor also will see it for helping on support operations.\n",
                          optional: false
                        },
                        {
                          name: 'tier1_external_uid',
                          label: 'Tier 1 External UID',
                          hint: "Provide if you have it a unique identifier in the form of a UUID for the tier on the commerce system, in case it's not provided a unique UUID will be auto-generated.",
                          optional: true
                        },
                        {
                          name: 'tier1_account_name',
                          label: 'Tier 1 Account Name',
                          hint: "Specify the company or account name on the commerce system to be used for request creation.",
                          optional: false
                        },
                        {
                          name: 'tier1_address_line1',
                          label: 'Tier 1 Address Line 1',
                          hint: "Provide the postal address of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.",
                          optional: false
                        },
                        {
                          name: 'tier1_address_line2',
                          label: 'Tier 1 Address Line 2',
                          hint: '',
                          optional: true
                        },
                        {
                          name: 'tier1_postal_code',
                          label: 'Tier 1 Postal Code',
                          hint: "Provide the postal code of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.",
                          optional: false
                        },
                        {
                          name: 'tier1_city',
                          label: 'Tier 1 City',
                          hint: "Please specify the City name of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.",
                          optional: false
                        },
                        {
                          name: 'tier1_state',
                          label: 'Tier 1 State Or Province',
                          hint: '',
                          optional: false
                        },

                        {
                          name: 'tier1_country',
                          label: 'Tier 1 Country',
                          hint: 'Provide the country of the related account, please use Alpha-2 code.',
                          optional: false
                        },
                        {
                          name: 'tier1_first_name',
                          label: 'Tier 1 Contact First Name',
                          hint: 'Provide the contact name of the technical contact related with the account.',
                          optional: false
                        },
                        {
                          name: 'tier1_last_name',
                          label: 'Tier 1 Contact Last Name',
                          hint: 'Provide the last name or family name of the technical contact related with the account.',
                          optional: false
                        },
                        {
                          name: 'tier1_email',
                          label: 'Tier 1 Email',
                          hint: "Provide the email address of the technical contact related with the account, this one typically is a requirement by vendors to process the request, additionally please note that this email will be used to send inquire requests related with the fulfillment of the request.\n",
                          optional: false
                        },
                        {
                          name: 'tier1_phone_number',
                          label: 'Tier 1 Phone Number',
                          hint: "Provide the phone number of the technical contact. We suggest to use international phone notation in order to ensure the correctness of the phone number.\n",
                          optional: true
                        },
                        {
                          name: 'customer_external_id',
                          label: 'Customer External ID',
                          hint: 'Provide the ID of the Customer on the external system that will help you identify the account on Connect platform. Please note that vendor also will see it for helping on support operations.',
                          optional: false
                        },
                        {
                          name: 'customer_external_uid',
                          label: 'Customer External UID',
                          hint: "Provide if you have it a unique identifier in the form of a UUID for the tier on the commerce system, in case it's not provided a unique UUID will be auto-generated.",
                          optional: true
                        },
                        {
                          name: 'customer_account_name',
                          label: 'Customer Account Name',
                          hint: "Specify the company or account name on the commerce system to be used for request creation.\n",
                          optional: false
                        },
                        {
                          name: 'customer_address_line1',
                          label: 'Customer Address Line 1',
                          hint: "Provide the postal address of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.",
                          optional: false
                        },
                        {
                          name: 'customer_address_line2',
                          label: 'Customer Address Line 2',
                          hint: "Specify the company or account name on the commerce system to be used for request creation.\n",
                          optional: true
                        },

                        {
                          name: 'customer_postal_code',
                          label: 'Customer Postal Code',
                          hint: 'Provide the postal code of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.',
                          optional: false
                        },
                        {
                          name: 'customer_city',
                          label: 'Customer City',
                          hint: 'Please specify the City name of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.',
                          optional: false
                        },

                        {
                          name: 'customer_state',
                          label: 'Customer State Or Province',
                          hint: '',
                          optional: false
                        },

                        {
                          name: 'customer_country',
                          label: 'Customer Country',
                          hint: 'Provide the country of the related account, please use Alpha-2 code.',
                          optional: false
                        },

                        {
                          name: 'customer_contact_first_name',
                          label: 'Customer Contact First Name',
                          hint: 'Provide the contact name of the technical contact related with the account.',
                          optional: false
                        },

                        {
                          name: 'customer_contact_last_name',
                          label: 'Customer Contact Last Name',
                          hint: 'Provide the last name or family name of the technical contact related with the account.',
                          optional: false
                        },
                        {
                          name: 'customer_email',
                          label: 'Customer Email',
                          hint: "Provide the email address of the technical contact related with the account, this one typically is a requirement by vendors to process the request, additionally please note that this email will be used to send inquire requests related with the fulfillment of the request.",
                          optional: false
                        },
                        {
                          name: 'customer_phone_number',
                          label: 'Customer Phone Number',
                          hint: "Provide the phone number of the technical contact. We suggest to use international phone notation in order to ensure the correctness of the phone number.",
                          optional: true
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
        customer_external_uid = if input['customer_external_uid'].blank?
                                  call(:get_tier_external_uid, connection, input['customer_external_id'])
                                else
                                  input['customer_external_uid']
                                end

        asset_external_uid = if input['asset_external_uid'].blank?
                               workato.uuid
                             else
                               input['asset_external_uid']
                             end

        tier1_external_uid = if input['tier1_external_uid'].blank?
                               call(:get_tier_external_uid, connection, input['tier1_external_id'])
                             else
                               input['tier1_external_uid']
                             end

        marketplace_id = call(:get_maketplace_id, connection, input['marketplace_name'])

        payload = {
          'type' => 'purchase',
          'asset' => {
            'product' => {
              'id' => (input['product_id']).to_s

            },
            "connection": {
              "type": "production"
            },
            'external_uid' => asset_external_uid.to_s,
            'external_id' => (input['asset_external_id']).to_s,
            'items' => input['product_items'],
            'params' => [],
            'tiers' => {
              'customer' => {
                'name' => (input['customer_account_name']).to_s,
                'type' => 'customer',
                'external_id' => (input['customer_external_id']).to_s,
                'external_uid' => (customer_external_uid).to_s,

                'contact_info' => {
                  'address_line1' => (input['customer_address_line1']).to_s,
                  'address_line2' => (input['customer_address_line2']).to_s,
                  'city' => (input['customer_city']).to_s,
                  'state' => (input['customer_state']).to_s,
                  'postal_code' => (input['customer_postal_code']).to_s,
                  'country' => (input['customer_country']).to_s,
                  'contact' => {
                    'first_name' => (input['customer_contact_first_name']).to_s,
                    'last_name' => (input['customer_contact_last_name']).to_s,
                    'email' => (input['customer_email']).to_s,
                    'phone_number' => {
                      'country_code' => '',
                      'area_code' => '',
                      'phone_number' => '',
                      'extension' => ''
                    }
                  }
                }
              },
              'tier1' => {
                'name' => (input['tier1_account_name']).to_s,
                'type' => 'reseller',
                'external_uid' => tier1_external_uid.to_s,

                'contact_info' => {
                  'address_line1' => (input['tier1_address_line1']).to_s,
                  'address_line2' => (input['tier1_address_line2']).to_s,
                  'city' => (input['tier1_city']).to_s,
                  'state' => (input['tier1_state']).to_s,
                  'postal_code' => (input['tier1_postal_code']).to_s,
                  'country' => (input['tier1_country']).to_s,
                  'contact' => {
                    'first_name' => (input['tier1_first_name']).to_s,
                    'last_name' => (input['tier1_last_name']).to_s,
                    'email' => (input['tier1_email']).to_s,
                    'phone_number' => {
                      'country_code' => '',
                      'area_code' => '',
                      'phone_number' => '',
                      'extension' => ''
                    }
                  }
                }

              }
            }
          },
          'marketplace' => {
            'id' => marketplace_id.to_s
          }
        }
        response = post('/public/v1/requests', payload)
                   .after_error_response(/.*/) do |_, body, _, message|
          error("#{message}: #{body}")
        end

        response['customer_external_uid'] = customer_external_uid
        response['asset_external_uid'] = asset_external_uid
        response['tier1_external_uid'] = tier1_external_uid

        response
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },

    asset_change_request: {
      title: 'Asset change request',
      subtitle: '',
      description: '',
      help: "<a href='https://connect.cloudblue.com/community/api/openapi/#operations-Assets-request_list_createRequest' target='_blank'>Official documentation</a>",
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
            name: 'external_id',
            label: 'Asset external ID',
            hint: '',
            optional: false
          },
          {
            name: 'external_uid',
            label: 'External UID',
            hint: '',
            optional: false
          }

        ]
      end,

      execute: lambda do |_connection, input|
        payload = {
          'type' => 'change',
          'asset' => {
            'external_id' => input['external_id'],
            'external_uid' => input['external_uid'],
            'items' => input['items']
          }
        }

        response = post('/public/v1/requests', payload)
                   .after_error_response(/.*/) do |_, body, _, _message|
          parse_json(body)
        end
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['fr_response']
      end
    },


    get_usage_records: {
      title: 'Get usage records',
      subtitle: '',
      description: '',
      help: "<a href='https://connect.cloudblue.com/community/modules/usage_module/usage-api/' target='_blank'>Official documentation</a>",
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
    }


  },

  triggers: {
    updated_requests: {

      input_fields: lambda do
        [
          {
            name: 'product',
            label: 'Product',
            optional: true
          },
          {
            name: 'customer',
            label: 'Customer',
            optional: true
          },
          {
            name: 'request_types',
            label: 'Type(s) of requests',
            hint: "Please specify type(s) of requests to notify about. There should be request types supported by Connect, like 'purchase', 'cancel', 'change', 'suspend', 'resume'. Delimiter is a comma.",
            optional: false
          },
          {
            name: 'request_status',
            label: 'Status of requests',
            hint: "Please specify status(es) which request should have. There should be status supported by Connect, like 'failed', 'approved', 'inquiring' etc. Delimiter is a comma.",
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

        uri = '/public/v1/requests?'
        uri = uri + (!input['product'].blank? ? "eq(asset.product.id,#{input['product']})," : '')
        uri = uri + (!input['customer'].blank? ? "eq(tiers.customer.id,#{input['customer']})," : '')
        uri = uri + (!input['request_status'].blank? ? "in(status,(#{input['request_status']}))," : '')
        uri = uri + "in(type,(#{input['request_types']})),"
        uri = uri + "ge(updated,#{adjusted_updated_since.iso8601})"
        
        requests = get(uri)

        requests.each do |request|
          updated_since = [updated_since, request['updated'].to_time.utc].max
        end

        {
          events: requests,
          next_poll: updated_since.iso8601,
          can_poll_more: false
        }
      end,

      dedup: lambda do |request|
        request['id']
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['request']
      end
    },
    
    
    new_usage_files: {

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
            hint: "Please specify status(es) which usage file should have. There should be status supported by Connect, like 'draft', 'uploading', 'uploaded', 'invalid', 'processing', 'ready', 'rejected', 'pending', 'accepted', 'closed' and 'deleted'. Delimiter is a comma.",
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
        files['id']
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['usage_file']
      end
    }
    
    
  },

  pick_lists: {
      request_type: lambda do |connection|
        [
          ["Suspend","suspend"],
          ["Resume","resume"]
        ]
      end
  }

}
