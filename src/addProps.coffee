import {isFunction} from 'lodash'
import {useMemo} from 'react'

addProps = (updater, dependencyNames) -> (props) ->
  getAddedProps = ->
    if isFunction updater then updater props else updater

  addedProps = if dependencyNames
    useMemo(
      getAddedProps
      (props[dependencyName] for dependencyName in dependencyNames)
    )
  else
    getAddedProps()

  {
    ...props
    ...addedProps
  }

export default addProps
