import React, { useEffect } from 'react';
import { DndProvider } from 'react-dnd'
import HTML5Backend from 'react-dnd-html5-backend';
import AppBar from './AppBar';
import Page from './Page';
import { Provider, actions } from '../store';

const App = () => {
  useEffect(() => {
    actions.init();
  }, []);

  return (
    <DndProvider backend={HTML5Backend}>
      <Provider>
        <AppBar />
        <Page />
      </Provider>
    </DndProvider>
  );
}

export default App;
