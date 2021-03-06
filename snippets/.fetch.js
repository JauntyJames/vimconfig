fetch('')
.then(response => {
  if (response.ok) {
    return response;
  } else {
    let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
    throw(error);
  }
})
.then(response => response.json());
.then(body => {

})
.catch(error => console.error(`Error in fetch ${error.message}`));
