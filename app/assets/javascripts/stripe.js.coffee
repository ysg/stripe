jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  subscription.setupForm()

subscription =
  setupForm: ->
    $('#user_signup').submit ->
#      $('input[type=submit]').attr('disabled', true)
      subscription.processCard()
      false

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, subscription.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $("#user_stripe_card_token").val(response.id)
      $('#user_signup')[0].submit()
    else
      subscription.show_credit_card_error(response.error.message)
      $('input[type=submit]').attr('disabled', false)

  show_credit_card_error: (err) ->
    $('#error_explanation').remove()
    error_message = '<div id="error_explanation">'
    error_message += '<h2>1 error prohibited this user from being saved:</h2>'
    error_message += '<ul><li>'+err+'</li></ul>'
    error_message += '</div>'
    $("#user_signup").prepend(error_message)