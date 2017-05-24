import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { UserService } from '../user.service';

import { User } from '../user';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {
  users: { id: number, email: string, first_name: string, last_name: string, height_inches: number, weight_pounds: number, private_profile: boolean }[];
  selectedUser: User;

  constructor(
    private router: Router,
    private userService: UserService
  ) { }

  ngOnInit() {
    this.userService.getList()
      .subscribe(response => this.users = response.json());
  }

  onSelect(user: User): void {
    this.selectedUser = user;
  }

  goToDetail(user: User): void {
    console.log(user)
    this.router.navigate(['/user-detail', user.id]);
  }

}
