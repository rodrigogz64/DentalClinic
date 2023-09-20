import { useState, useEffect } from 'react'
import './App.css'

function App() {
  const [data, setData] = useState()

  const getData = async () => {
    try {
      const response = await fetch('http://localhost:3000/users');
      const data = await response.json();
      setData(data);
    } catch (error) { console.error('Error', error); }
  }

  useEffect( () => { getData() }, [])

  return (
    <p>{JSON.stringify(data, null, 2)}</p>
  )
}

export default App
