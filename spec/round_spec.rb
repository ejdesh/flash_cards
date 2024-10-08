require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).not_to be_nil
  end

  it 'has no turns when created' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to be_empty
  end

  it 'has at least one card' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.deck.cards).to_not be_empty
  end

  it 'turn to be a turn' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('whaaa')

    expect(new_turn).to be_a(Turn)
  end

  it 'can count correct by category' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('bye')

    expect(round.number_correct_by_category(:whaatok)).to eq(1)
  end

  it 'can calculate total percentage' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'byebye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn('bye')
    round.take_turn('fsdsfd')

    expect(round.percent_correct).to eq(50.0)
  end

  it 'can check the current card' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'byebye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn('bye')
    round.take_turn('fsdsfd')

    expect(round.current_card).to eq(card_2)
  end
end
