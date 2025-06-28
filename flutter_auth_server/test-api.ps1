curl.exe -X POST http://192.168.1.100:3000/api/signup `
  -H "Content-Type: application/json" `
  -d '{ "email": "newuser@xedu.app", "password": "abc123", "name": "Test User", "username": "testuser", "job": "Student", "phone": "0123456789", "address": "Test City" }'

curl.exe -X POST http://192.168.1.100:3000/api/login `
  -H "Content-Type: application/json" `
  -d '{ "email": "islambardala@gmail.com", "password": "password123" }'

curl.exe http://192.168.1.100:3000/api/advisors

curl.exe http://192.168.1.100:3000/api/advisors/2

curl.exe http://192.168.1.100:3000/api/profile `
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."

curl.exe http://192.168.1.100:3000/api/profile `
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
