class window.HandView extends Backbone.View
  initialize: ->
    @collection.on('add', @render, @)

  addCard: (card) ->
    view = new CardView({model: card})
    @$el.append(view.el)

  render: ->
    @$el.html('');
    @collection.each( (card) => @addCard(card) )



class window.CardView extends Backbone.View
  initialize: ->
    @render()

  render: ->
    template = _.template('<div class="card"><%= name %> of <%= suit %></div>')
    @$el.append(template(@model.attributes))


class window.ScoreView extends Backbone.View
  initialize: ->
    @collection.on('add', @render, @)
    @render()

  render: ->
    @$el.html('')
    value = @collection.valueHand()
    @$el.append(value)