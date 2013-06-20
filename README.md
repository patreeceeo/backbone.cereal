# BACKBONE.CEREAL
Automatically serialize and deserialize any type of object in your backbone model attributes.

Using the initial attributes, whether they come from the `defaults` object or from the attributes argued at instantiation, `Cereal.Model` intellegently guesses how to serialize/deserialize any object/primative types in `toJSON()` and `set()` respectively.

### Example Instantiations
    class Actor extends Slouch.Model
      defaults:
        coach: new Actor()
        birthday: moment(0)
      deserializers: [
        test: (value) ->
          if moment(value).isValid() and _.isString(value)
            moment
      ]

    model1 = new Actor()

### Cereal.Model will serialize and de-serialize using its type infomation.

    model1.set('coach', {color: 'gold', name: 'Carl', age: 56}) # Everything's cool.
    model1.get('coach').get('name') # is 'Carl'
    model1.toJSON().coach.name # also 'Carl'

    now = moment()
    model1.set('birthday', now.format())
    model1.get('birthday').format() # is now.format()

## Dependencies (Production)
- backbone.js (http://backbonejs.org)
- underscore.js (http://underscorejs.org)

      



    

