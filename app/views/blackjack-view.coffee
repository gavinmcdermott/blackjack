class window.BlackjackView extends Backbone.View

  events:
    "click .hit-button": "hit"
    "click .stand-button": "stand"
    "click .reset-button": "reset"

  initialize: ->
    @collection = new Deck()
    @dealer = new Hand()
    @player = new Hand()
    @dealerHandView = new HandView({collection: @dealer, el: '.dealer-cards'})
    @playerHandView = new HandView({collection: @player, el: '.player-cards'})
    @reset()
    @dealerHandView = new ScoreView({collection: @dealer, el: '.dealer-score'})
    @playerHandView = new ScoreView({collection: @player, el: '.player-score'})

  reset: ->
    $('.hit-button').removeAttr("disabled")
    $('h1').html('Let\'s Play...')
    @dealer.resetHand()
    @player.resetHand()
    _(2).times( => @deal(@dealer))
    _(2).times( => @deal(@player))

  deal: (hand) =>
    hand.add(@collection.pop())

  hit: =>
    @player.add(@collection.pop())
    @player.valueHand()
    if @player.valueHand() >= 21
      $('.hit-button').attr("disabled", "disabled") 
      $('h1').html('BlackJack!')

  stand: ->
    # alert "TOTO implement stand"