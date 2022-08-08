local schema = {
    "type": "object",
    "required": [],
    "properties": {
      "owner_tag": {
        "type": "string",
        "default": "Contoso",
        "description": "Owner tag to be applied to resources.",
        "examples": [
            "Contoso"
        ]
      },
      "resource_location": {
        "type": "string",
        "default": "australiaeast",
        "description": "Azure region to be used for deployment.",
        "enum": [
            "australiaeast",
            "brazilsouth",
            "eastasia",
            "eastus",
            "eastus2",
            "northeurope",
            "southcentralus",
            "southeastasia",
            "westcentralus",
            "westeurope",
            "westus",
            "westus2"
         ],
         "examples":[]
      },
      "environment_tag": {
        "type": "string",
        "default": "dev",
        "description": "Environment tag to be used in resource naming convention. Keep to 3 letters to prevent names becoming too long.",
        "examples": [
            "dev"
        ]
      },
      "domain": {
        "type": "string",
        "default": "mydomain.com",
        "description": "Azure Active Directory Domain to be used for authentication",
        "examples": [
            "mydomain.com"
        ]
      },
      "subscription_id": {
        "type": "string",
        "default": "035ass64-f00d-48e2-b582-4fe1ss905ee3",
        "description": "Id of the subscription into which the analytics landing zone will be deployed",
        "examples": [
            "035a1ss4-f00d-48e2-b582-4fe1ss905ee3"
        ]
      },
      "prefix": {
        "type": "string",
        "default": "ads",
        "description": "Prefix to be applied to all resource names. Keep to 3 letters to prevent names becoming too long.",
        "examples": [
            "ads"
        ]
      },
      "resource_group_name": {
        "type": "string",
        "default": "gf1",
        "description": "Name of the resource group into which the analytics landing zone will be deployed",
        "examples": [
            "gf1"
        ]
      },
      "ip_address": {
        "type": "string",
        "examples": [],
        "description": ""
      },
      "ip_address2": {
        "type": "string",
        "examples": [],
        "description": ""
      },
      "tenant_id": {
        "type": "string",
        "examples": [],
        "description": ""
      },
      "deployment_principal_layers1and3": {
        "description": "Object Id of the AAD account that will manage layer's 1 & 3. Note leave this blank if you are going to also include this principal in the resource owner's collection.",
        "type": "string",
        "default": "",
        "examples": []
      },
      "resource_owners": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "examples": [],
        "description": ""
      },
      "synapse_administrators": {
        "type": "object",
        "required": [],
        "properties": {},
        "default": {},
        "description": "Object with a property for each user that is to be a Synapse Administrator. The property name is descriptive only and should be unique. The property value is the object_id of the user. Leave as empty object when not is use. NOTE - do not include the Synpase Workspace creator in this list as it will be added automatically.",
        "examples": [
            {
                "user_1": "5c736d19-4076-4a76-87f3-6fbfd77f007d",
                "user_2": "5c732d19-4076-4a76-87f3-6fbfd72f007d"
            }]
      },
      "azure_sql_aad_administrators": {
        "type": "object",
        "required": [],        
        "default": {"sql_aad_admin": ""},
        "description": "Object with a property for each user that is to be a Azure SQL Administrator. This should be a user or AAD Group. The property name should be the username of the user in AAD and should be unique. The property value is the object_id of the user. You MUST provide the sql_aad_admin property which will determine the AAD Admin setting for the Azure SQL Server. ",
        "properties": {
          "sql_aad_admin": {
            "type": "string"
          },
          "deploy_agent": {
            "type": "string"
          }
        },
        "examples": [
            {
                "sql_aad_admin": "5c736d19-4076-4a76-87f3-6fbfd77f007d",
                "deploy_agent": "5c732d19-4076-4a76-87f3-6fbfd72f007d"
            }
        ]
      },
      "synapse_publishers": {
        "type": "object",
        "required": [],
        "properties": {},
        "default": {},
        "description": "Object with a property for each user that is to be a Synapse Publisher. The property name is descriptive only and should be unique. The property value is the object_id of the user. Leave as empty object when not is use.",
        "examples": [
            {
                "user_1": "5c736d19-4076-4a76-87f3-6fbfd77f007d",
                "user_2": "5c732d19-4076-4a76-87f3-6fbfd72f007d"
            }
        ]
          
      },
      "synapse_contributors": {
        "type": "object",
        "required": [],
        "properties": {},
        "default": {},
        "description": "Object with a property for each user that is to be a Synapse Contributor. The property name is descriptive only and should be unique. The property value is the object_id of the user. Leave as empty object when not is use.",
        "examples": [
            {
                "user_1": "5c736d19-4076-4a76-87f3-6fbfd77f007d",
                "user_2": "5c732d19-4076-4a76-87f3-6fbfd72f007d"
            }]
      },
      "WEB_APP_ADMIN_USER": {
        "type": "string",
        "default": "#####",
        "description": "Object_Id of the user that you would like to have direct, explicit admin access to framework web front end.Set to '#####' if not in use. This setting over-rides the WEB_APP_ADMIN_SECURITY_GROUP. Use in scenarios where use of a security group is not possible.",
        "examples": [
            "5c732d19-4076-4a76-87f3-6fbfd72f007d"            
          ]
      },
      "WEB_APP_ADMIN_SECURITY_GROUP": {
        "type": "string",
        "default": "#####",
        "description": "Name of the security group whos memebers will be given admin access to framework web front end.Set to '#####' if not in use.",
        "examples": [
            "mysecuritygroup"            
          ]
      },
      "ARM_SYNAPSE_WORKSPACE_NAME": {
        "type": "string",
        "default": "adsstgsynwadslwra",
        "description": "Post Layer 1 Resource name. Deployment of Terraform Layer One will give you these values. They are required to allow subsequent agent deployments to open firewall rules to allow deployment updates.",
        "examples": [
            "adsstgsynwadslwra"            
          ]
      },
      "ARM_KEYVAULT_NAME": {
        "type": "string",
        "default": "ads-stg-kv-ads-lwra",
        "description": "Post Layer 1 Resource name. Deployment of Terraform Layer One will give you these values. They are required to allow subsequent agent deployments to open firewall rules to allow deployment updates..",
        "examples": [
            "ads-stg-kv-ads-lwra"            
          ]
      },
      "ARM_DATALAKE_NAME": {
        "type": "string",
        "default": "adsstgdlsadslwraadsl",
        "description": "Post Layer 1 Resource name. Deployment of Terraform Layer One will give you these values. They are required to allow subsequent agent deployments to open firewall rules to allow deployment updates..",
        "examples": [
            "adsstgdlsadslwraadsl"            
          ]
      },
      "ARM_PAL_PARTNER_ID": {
        "type": "string",
        "default": "0",
        "description": "ID of Implementation Partner for PAL purposes. Set to 0 if not in use",
        "examples": [
            "0"            
          ]
      },
      "GIT_REPOSITORY_NAME": {
        "type": "string",
        "default": "#####",
        "description": "Git Repository name used for for publishing ADF and Synapse artefacts.  Only used if synapse_git_toggle_integration or adf_git_toggle_integration is true in the hcl file. Set to '#####' if not using Git integration for Synapse and ADF.",
        "examples": [
            "mytestrepo"            
          ]
      },
      "GIT_SYNAPSE_REPOSITORY_BRANCH_NAME": {
        "type": "string",
        "default": "#####",
        "description": "Git Branch Name associated with the branch that will be used to publish Synapse artefacts. Only used if synapse_git_toggle_integration is true in the hcl file. Set to '#####' if not using Git integration for Synapse and ADF.",
        "examples": [
            "main"            
          ]
      },
      "GIT_USER_NAME": {
        "type": "string",
        "default": "#####",
        "description": "Usernames of git user used for publishing artefacts.  Only used if synapse_git_toggle_integration or adf_git_toggle_integration is true in the hcl file.  Set to '#####' if not using Git integration for Synapse and ADF.",
        "examples": [
            "test user"            
          ]
      },
      "GIT_EMAIL_ADDRESS": {
        "type": "string",
        "default": "#####",
        "description": "Email address of git user used for publishing artefacts.  Only used if synapse_git_toggle_integration or adf_git_toggle_integration is true in the hcl file. Set to '#####' if not using Git integration for Synapse and ADF.",
        "examples": [
            "test@test.com"            
          ]
      },
      "GIT_ADF_REPOSITORY_NAME": {
        "type": "string",
        "default": "#####",
        "description": "Git Repository name used for for publishing ADF and Synapse artefacts.  Only used if synapse_git_toggle_integration or adf_git_toggle_integration is true in the hcl file.Set to '#####' if not using Git integration for Synapse and ADF.",
        "examples": [
            "mytestrepo"            
          ]
      },
      "GIT_ADF_REPOSITORY_BRANCH_NAME": {
        "type": "string",
        "default": "#####",
        "description": "Git Branch Name associated with the branch that will be used to publish Synapse artefacts. Only used if synapse_git_toggle_integration is true in the hcl file. Set to '#####' if not using Git integration for Synapse and ADF.",
        "examples": [
            "main"            
          ]
      },
      "GIT_ADF_USER_NAME": {
        "type": "string",
        "default": "#####",
        "description": "Usernames of git user used for publishing artefacts.  Only used if synapse_git_toggle_integration or adf_git_toggle_integration is true in the hcl file.  Set to '#####' if not using Git integration for Synapse and ADF.",
        "examples": [
            "test user"            
          ]
      },
      "GIT_ADF_EMAIL_ADDRESS": {
        "type": "string",
        "default": "#####",
        "description": "Email address of git user used for publishing artefacts.  Only used if synapse_git_toggle_integration or adf_git_toggle_integration is true in the hcl file. Set to '#####' if not using Git integration for Synapse and ADF.",
        "examples": [
            "test@test.com"            
          ]
      },
      "FeatureTemplateOverrides": {
        "type": "object",
        "description": "Each deployment references a feature template (eg. basic_deployment, full_deployment etc). This collection of objects allows you to override the default feature template values.",
        "required": [],
        "properties": 
        {

        },
        "examples": [
          {"is_onprem_datafactory_ir_registered":true}
        ]
      }

      
    }
  };

local properties = schema["properties"];

{
  "test":   [  // Object comprehension.
              {
                  ["01.Property"]: sd,
                  ["02.Type"]: properties[sd]["type"],
                  ["03.Description"]: properties[sd]["description"],

                  #["Examples"]: properties[sd]["examples"],
              }
              for sd in std.objectFields(properties)
            ]
}