import React, { MouseEventHandler } from 'react'

type SimpleButtonProps = {
  text: string
  onClick: MouseEventHandler<HTMLButtonElement>
}

const SimpleButton: React.FC<SimpleButtonProps> = (
  props: SimpleButtonProps,
) => {
  const { text, onClick } = props

  return <button onClick={onClick}>{text}</button>
}

export default SimpleButton
