describe 'Cereal.Model', ->
  model1 = null
  model2 = null

  beforeEach ->
    class Actor extends Cereal.Model
      defaults:
        coach: new Actor()
        birthday: moment(0)
      deserializers: [
        test: (value) ->
          moment if moment(value).isValid() and _.isString(value) 
      ]

    model1 = new Actor()

  it 'should be defined', ->
    expect(Cereal.Model).toBeDefined()

  describe 'how it works', ->

    it 'should automatically deserialize serialized objects', ->
      expect(-> model1.set 'coach',
        color: 'gold'
        name: 'Carl'
        age: 56
      ).not.toThrow()
      expect(model1.get('coach').get('name')).toBe 'Carl'

    it 'should know how to serialize nested models/collections', ->
      model1.set 'coach',
        color: 'gold'
        name: 'Carl'
        age: 56
      model1JSON = model1.toJSON()
      expect(model1JSON.coach.name).toBe 'Carl'

    it 'should (be able to) know how to deserialize anything!', ->
      now = moment()
      model1.set('birthday', now.format())
      expect(model1.get('birthday').format()).toBe now.format()


      



    
