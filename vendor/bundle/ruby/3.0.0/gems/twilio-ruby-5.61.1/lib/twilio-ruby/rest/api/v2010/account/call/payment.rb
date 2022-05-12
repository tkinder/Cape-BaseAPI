##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class CallContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class PaymentList < ListResource
              ##
              # Initialize the PaymentList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that created the Payments
              #   resource.
              # @param [String] call_sid The SID of the
              #   {Call}[https://www.twilio.com/docs/voice/api/call-resource] the Payments
              #   resource is associated with. This will refer to the call sid that is producing
              #   the payment card (credit/ACH) information thru DTMF.
              # @return [PaymentList] PaymentList
              def initialize(version, account_sid: nil, call_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, call_sid: call_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Payments.json"
              end

              ##
              # Create the PaymentInstance
              # @param [String] idempotency_key A unique token that will be used to ensure that
              #   multiple API calls with the same information do not result in multiple
              #   transactions. This should be a unique string value per API call and can be a
              #   randomly generated.
              # @param [String] status_callback Provide an absolute or relative URL to receive
              #   status updates regarding your Pay session. Read more about the {expected
              #   StatusCallback
              #   values}[https://www.twilio.com/docs/voice/api/payment-resource#statuscallback]
              # @param [payment.BankAccountType] bank_account_type Type of bank account if
              #   payment source is ACH. One of `consumer-checking`, `consumer-savings`, or
              #   `commercial-checking`. The default value is `consumer-checking`.
              # @param [String] charge_amount A positive decimal value less than 1,000,000 to
              #   charge against the credit card or bank account. Default currency can be
              #   overwritten with `currency` field. Leave blank or set to 0 to tokenize.
              # @param [String] currency The currency of the `charge_amount`, formatted as {ISO
              #   4127}[http://www.iso.org/iso/home/standards/currency_codes.htm] format. The
              #   default value is `USD` and all values allowed from the <Pay> Connector are
              #   accepted.
              # @param [String] description The description can be used to provide more details
              #   regarding the transaction. This information is submitted along with the payment
              #   details to the Payment Connector which are then posted on the transactions.
              # @param [String] input A list of inputs that should be accepted. Currently only
              #   `dtmf` is supported. All digits captured during a pay session are redacted from
              #   the logs.
              # @param [String] min_postal_code_length A positive integer that is used to
              #   validate the length of the `PostalCode` inputted by the user. User must enter
              #   this many digits.
              # @param [Hash] parameter A single level JSON string that is required when
              #   accepting certain information specific only to ACH payments. The information
              #   that has to be included here depends on the <Pay> Connector. {Read
              #   more}[https://www.twilio.com/console/voice/pay-connectors].
              # @param [String] payment_connector This is the unique name corresponding to the
              #   Payment Gateway Connector installed in the Twilio Add-ons. Learn more about
              #   {<Pay> Connectors}[https://www.twilio.com/console/voice/pay-connectors]. The
              #   default value is `Default`.
              # @param [payment.PaymentMethod] payment_method Type of payment being captured.
              #   One of `credit-card` or `ach-debit`. The default value is `credit-card`.
              # @param [Boolean] postal_code Indicates whether the credit card postal code (zip
              #   code) is a required piece of payment information that must be provided by the
              #   caller. The default is `true`.
              # @param [Boolean] security_code Indicates whether the credit card security code
              #   is a required piece of payment information that must be provided by the caller.
              #   The default is `true`.
              # @param [String] timeout The number of seconds that <Pay> should wait for the
              #   caller to press a digit between each subsequent digit, after the first one,
              #   before moving on to validate the digits captured. The default is `5`, maximum is
              #   `600`.
              # @param [payment.TokenType] token_type Indicates whether the payment method
              #   should be tokenized as a `one-time` or `reusable` token. The default value is
              #   `reusable`. Do not enter a charge amount when tokenizing. If a charge amount is
              #   entered, the payment method will be charged and not tokenized.
              # @param [String] valid_card_types Credit card types separated by space that Pay
              #   should accept. The default value is `visa mastercard amex`
              # @return [PaymentInstance] Created PaymentInstance
              def create(idempotency_key: nil, status_callback: nil, bank_account_type: :unset, charge_amount: :unset, currency: :unset, description: :unset, input: :unset, min_postal_code_length: :unset, parameter: :unset, payment_connector: :unset, payment_method: :unset, postal_code: :unset, security_code: :unset, timeout: :unset, token_type: :unset, valid_card_types: :unset)
                data = Twilio::Values.of({
                    'IdempotencyKey' => idempotency_key,
                    'StatusCallback' => status_callback,
                    'BankAccountType' => bank_account_type,
                    'ChargeAmount' => charge_amount,
                    'Currency' => currency,
                    'Description' => description,
                    'Input' => input,
                    'MinPostalCodeLength' => min_postal_code_length,
                    'Parameter' => Twilio.serialize_object(parameter),
                    'PaymentConnector' => payment_connector,
                    'PaymentMethod' => payment_method,
                    'PostalCode' => postal_code,
                    'SecurityCode' => security_code,
                    'Timeout' => timeout,
                    'TokenType' => token_type,
                    'ValidCardTypes' => valid_card_types,
                })

                payload = @version.create('POST', @uri, data: data)

                PaymentInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.PaymentList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class PaymentPage < Page
              ##
              # Initialize the PaymentPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [PaymentPage] PaymentPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of PaymentInstance
              # @param [Hash] payload Payload response from the API
              # @return [PaymentInstance] PaymentInstance
              def get_instance(payload)
                PaymentInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.PaymentPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class PaymentContext < InstanceContext
              ##
              # Initialize the PaymentContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that will update the
              #   resource.
              # @param [String] call_sid The SID of the call that will update the resource. This
              #   should be the same call sid that was used to create payments resource.
              # @param [String] sid The SID of Payments session that needs to be updated.
              # @return [PaymentContext] PaymentContext
              def initialize(version, account_sid, call_sid, sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, call_sid: call_sid, sid: sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Payments/#{@solution[:sid]}.json"
              end

              ##
              # Update the PaymentInstance
              # @param [String] idempotency_key A unique token that will be used to ensure that
              #   multiple API calls with the same information do not result in multiple
              #   transactions. This should be a unique string value per API call and can be a
              #   randomly generated.
              # @param [String] status_callback Provide an absolute or relative URL to receive
              #   status updates regarding your Pay session. Read more about the
              #   {Update}[https://www.twilio.com/docs/voice/api/payment-resource#statuscallback-update]
              #   and
              #   {Complete/Cancel}[https://www.twilio.com/docs/voice/api/payment-resource#statuscallback-cancelcomplete]
              #   POST requests.
              # @param [payment.Capture] capture The piece of payment information that you wish
              #   the caller to enter. Must be one of `payment-card-number`, `expiration-date`,
              #   `security-code`, `postal-code`, `bank-routing-number`, or `bank-account-number`.
              # @param [payment.Status] status Indicates whether the current payment session
              #   should be cancelled or completed. When `cancel` the payment session is
              #   cancelled. When `complete`, Twilio sends the payment information to the selected
              #   <Pay> connector for processing.
              # @return [PaymentInstance] Updated PaymentInstance
              def update(idempotency_key: nil, status_callback: nil, capture: :unset, status: :unset)
                data = Twilio::Values.of({
                    'IdempotencyKey' => idempotency_key,
                    'StatusCallback' => status_callback,
                    'Capture' => capture,
                    'Status' => status,
                })

                payload = @version.update('POST', @uri, data: data)

                PaymentInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.PaymentContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.PaymentContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class PaymentInstance < InstanceResource
              ##
              # Initialize the PaymentInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that created the Payments
              #   resource.
              # @param [String] call_sid The SID of the
              #   {Call}[https://www.twilio.com/docs/voice/api/call-resource] the Payments
              #   resource is associated with. This will refer to the call sid that is producing
              #   the payment card (credit/ACH) information thru DTMF.
              # @param [String] sid The SID of Payments session that needs to be updated.
              # @return [PaymentInstance] PaymentInstance
              def initialize(version, payload, account_sid: nil, call_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'call_sid' => payload['call_sid'],
                    'sid' => payload['sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'uri' => payload['uri'],
                }

                # Context
                @instance_context = nil
                @params = {'account_sid' => account_sid, 'call_sid' => call_sid, 'sid' => sid || @properties['sid'], }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [PaymentContext] PaymentContext for this PaymentInstance
              def context
                unless @instance_context
                  @instance_context = PaymentContext.new(
                      @version,
                      @params['account_sid'],
                      @params['call_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created the Payments resource.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Call the resource is associated with.
              def call_sid
                @properties['call_sid']
              end

              ##
              # @return [String] The SID of the Payments resource.
              def sid
                @properties['sid']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that the resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The URI of the resource, relative to `https://api.twilio.com`
              def uri
                @properties['uri']
              end

              ##
              # Update the PaymentInstance
              # @param [String] idempotency_key A unique token that will be used to ensure that
              #   multiple API calls with the same information do not result in multiple
              #   transactions. This should be a unique string value per API call and can be a
              #   randomly generated.
              # @param [String] status_callback Provide an absolute or relative URL to receive
              #   status updates regarding your Pay session. Read more about the
              #   {Update}[https://www.twilio.com/docs/voice/api/payment-resource#statuscallback-update]
              #   and
              #   {Complete/Cancel}[https://www.twilio.com/docs/voice/api/payment-resource#statuscallback-cancelcomplete]
              #   POST requests.
              # @param [payment.Capture] capture The piece of payment information that you wish
              #   the caller to enter. Must be one of `payment-card-number`, `expiration-date`,
              #   `security-code`, `postal-code`, `bank-routing-number`, or `bank-account-number`.
              # @param [payment.Status] status Indicates whether the current payment session
              #   should be cancelled or completed. When `cancel` the payment session is
              #   cancelled. When `complete`, Twilio sends the payment information to the selected
              #   <Pay> connector for processing.
              # @return [PaymentInstance] Updated PaymentInstance
              def update(idempotency_key: nil, status_callback: nil, capture: :unset, status: :unset)
                context.update(
                    idempotency_key: idempotency_key,
                    status_callback: status_callback,
                    capture: capture,
                    status: status,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.PaymentInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.PaymentInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end