import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';

import { User } from './user';

@Injectable()
export class UserService {

  constructor(private http: Http) { }

  getList() {
    return this.http.get('/api/users.json');
  }

  getUser(id: number) {
    console.log(this.http.get(`/api/users/${id}`));
    console.log('hi')
    return this.http.get(`/api/users/${id}`);
      // .then(response => response.json().data as User)
  }

  save(user) {
    let body = JSON.stringify({ user: user });
    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers: headers });
    return this.http.post('/api/users.json', body, options);
  }
}
