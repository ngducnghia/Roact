sub init()
    m.top.state = {}
end sub

sub componentDidMount(p)
end sub

sub componentDidUpdate(prevProps)
end sub

function shouldComponentUpdate()
    return true
end function

function render(p)
    ?"WARNING: render() not implemented", m.top.id
    return invalid
end function

function conditionalRender(p)
    if shouldComponentUpdate()
        r = render(p)
        r.__instance = strI(rnd(2147483647), 36)
        m.top.lastRender = r
    end if
    return m.top.lastRender
end function

sub setState(changedState)
    state = m.top.state
    state.append(changedState)
    m.top.state = state
    RoactUpdateElement(m.top, m.top.props)
end sub

function createHandler(functionName)
    return {
        node: m.top
        func: functionName
    }
end function

sub executeHandler(handler, args = invalid)
    handler.node.callFunc(handler.func, args)
end sub
