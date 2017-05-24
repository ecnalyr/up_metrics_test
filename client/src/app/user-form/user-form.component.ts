import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from '../user';
import { UserService } from '../user.service';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css']
})
export class UserFormComponent implements OnInit {
  model = new User('')

  constructor(private userService: UserService,
              private router: Router) { }

  ngOnInit() {
  }

  onSubmit() {
    this.userService
      .save(this.model)
      .subscribe(response => this.router.navigate(['']));
  }
}
