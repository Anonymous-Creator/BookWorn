const firstname = document.getElementById('firstname');
            const lastname = document.getElementById('lastname');
            const email = document.getElementById('email');
	        const mobile = document.getElementById('mobileno');
            const username = document.getElementById('username');



            const password = document.getElementById('password');
            const RegForm = document.getElementById('RegForm');
            const errorElement = document.getElementById('error');
			var mailformat = /^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/;
            RegForm.addEventListener('submit', (e) =>{
              let messages = []
              if (firstname.value === '' || firstname.value == null) {
                messages.push('Name is required');
              }

              if (password.value.length <= 6) {
                messages.push('Password must be longer than 6 characters');
              }

              if (password.value.length >= 20) {
                messages.push('Password must be less than 20 characters');
              }
              if(email.value.match(mailformat)){}
              else{
                  messages.push('please enter a valid email');
              }

              if (username.value === ''||username.value===null) {
                messages.push('Username is required');
              }

              if (messages.length > 0) {
                e.preventDefault();
                errorElement.innerText = messages.join(', ');
              }
            })