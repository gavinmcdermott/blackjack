class window.Card extends Backbone.Model
  initialize: ->
    @attributes.suit = ['clubs','spades','hearts','diamonds'][Math.floor @attributes.cardID / 13]
    @attributes.value = @attributes.cardID % 13
    namedCards =
      0  : 'Ace'
      10 : 'Jack'
      11 : 'Queen'
      12 : 'King'
    @attributes.name = namedCards[@attributes.value]
    @attributes.value += 1 if not @attributes.name
    @attributes.value = 10 if @attributes.name is 'King' or @attributes.name is 'Queen' or @attributes.name is 'Jack'
    @attributes.value = 11 if @attributes.name is 'Ace'
    @attributes.name = @attributes.value if @attributes.name is undefined


class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    cards = _.shuffle([0..51])
    @add(new Card({cardID: card}) for card in cards)


class window.Hand extends Backbone.Collection

    model: Card

    resetHand: ->
      @reset()

    getBeginningValue: ->
      _.reduce(@models, (memo, model) ->
        memo + model.attributes.value
      ,0)

    valueHand: ->
      score = @getBeginningValue()
      aces = @acesInHand()
      return score if aces is 0
      until score <= 21 or aces is 0
        score -= 10
        aces -= 1
      score

    acesInHand: ->
      (model for model in @.models when model.attributes.name is "Ace").length