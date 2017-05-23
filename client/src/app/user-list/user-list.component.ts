import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {
  users: { id: number, email: string, first_name: string, last_name: string, height_inches: number, weight_pounds: number, private_profile: boolean }[];

  constructor(private userService: UserService) { }

  ngOnInit() {
    this.userService.getList()
      .subscribe(response => this.users = response.json());
  }

}
